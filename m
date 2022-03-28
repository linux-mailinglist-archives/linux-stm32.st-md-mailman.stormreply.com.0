Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 133954EA7F1
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 08:33:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5786C628C5;
	Tue, 29 Mar 2022 06:33:00 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8AE9C60490
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 17:52:31 +0000 (UTC)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KS0Zw6Tljz67mcQ;
 Tue, 29 Mar 2022 01:50:00 +0800 (CST)
Received: from roberto-ThinkStation-P620.huawei.com (10.204.63.22) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 28 Mar 2022 19:52:29 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: <corbet@lwn.net>, <viro@zeniv.linux.org.uk>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <kpsingh@kernel.org>,
 <shuah@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <zohar@linux.ibm.com>
Date: Mon, 28 Mar 2022 19:50:24 +0200
Message-ID: <20220328175033.2437312-10-roberto.sassu@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220328175033.2437312-1-roberto.sassu@huawei.com>
References: <20220328175033.2437312-1-roberto.sassu@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.204.63.22]
X-ClientProxiedBy: lhreml754-chm.china.huawei.com (10.201.108.204) To
 fraeml714-chm.china.huawei.com (10.206.15.33)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 29 Mar 2022 06:32:58 +0000
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 Roberto Sassu <roberto.sassu@huawei.com>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 09/18] bpf-preload: Generate code to pin
	non-internal maps
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Take the non-internal maps from the skeleton, and generate the code for
each of them (static variable declaration, additional code in
free_objs_and_skel(), preload() and load_skel()).

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 tools/bpf/bpftool/gen.c | 97 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tools/bpf/bpftool/gen.c b/tools/bpf/bpftool/gen.c
index ad948f1c90b5..28b1fe718248 100644
--- a/tools/bpf/bpftool/gen.c
+++ b/tools/bpf/bpftool/gen.c
@@ -655,6 +655,8 @@ static void codegen_destroy(struct bpf_object *obj, const char *obj_name)
 static void codegen_preload_vars(struct bpf_object *obj, const char *obj_name)
 {
 	struct bpf_program *prog;
+	struct bpf_map *map;
+	char ident[256];
 
 	codegen("\
 		\n\
@@ -668,6 +670,19 @@ static void codegen_preload_vars(struct bpf_object *obj, const char *obj_name)
 			", bpf_program__name(prog));
 	}
 
+	bpf_object__for_each_map(map, obj) {
+		if (!get_map_ident(map, ident, sizeof(ident)))
+			continue;
+
+		if (bpf_map__is_internal(map))
+			continue;
+
+		codegen("\
+			\n\
+			static struct bpf_map *%s_map;			    \n\
+			", ident);
+	}
+
 	codegen("\
 		\n\
 		static struct %s *skel;					    \n\
@@ -677,6 +692,8 @@ static void codegen_preload_vars(struct bpf_object *obj, const char *obj_name)
 static void codegen_preload_free(struct bpf_object *obj, const char *obj_name)
 {
 	struct bpf_program *prog;
+	struct bpf_map *map;
+	char ident[256];
 
 	codegen("\
 		\n\
@@ -693,6 +710,20 @@ static void codegen_preload_free(struct bpf_object *obj, const char *obj_name)
 			", bpf_program__name(prog));
 	}
 
+	bpf_object__for_each_map(map, obj) {
+		if (!get_map_ident(map, ident, sizeof(ident)))
+			continue;
+
+		if (bpf_map__is_internal(map))
+			continue;
+
+		codegen("\
+			\n\
+				if (!IS_ERR_OR_NULL(%1$s_map))		    \n\
+					bpf_map_put(%1$s_map);		    \n\
+			", ident);
+	}
+
 	codegen("\
 		\n\
 		\n\
@@ -705,6 +736,8 @@ static void codegen_preload(struct bpf_object *obj, const char *obj_name)
 {
 	struct bpf_program *prog;
 	const char *link_name;
+	struct bpf_map *map;
+	char ident[256];
 
 	codegen("\
 		\n\
@@ -722,6 +755,19 @@ static void codegen_preload(struct bpf_object *obj, const char *obj_name)
 			", bpf_program__name(prog));
 	}
 
+	bpf_object__for_each_map(map, obj) {
+		if (!get_map_ident(map, ident, sizeof(ident)))
+			continue;
+
+		if (bpf_map__is_internal(map))
+			continue;
+
+		codegen("\
+			\n\
+				bpf_map_inc(%s_map);			    \n\
+			", ident);
+	}
+
 	bpf_object__for_each_program(prog, obj) {
 		link_name = bpf_program__name(prog);
 		/* These need to be hardcoded for compatibility reasons. */
@@ -743,6 +789,24 @@ static void codegen_preload(struct bpf_object *obj, const char *obj_name)
 			", link_name, bpf_program__name(prog));
 	}
 
+	bpf_object__for_each_map(map, obj) {
+		if (!get_map_ident(map, ident, sizeof(ident)))
+			continue;
+
+		if (bpf_map__is_internal(map))
+			continue;
+
+		codegen("\
+			\n\
+			\n\
+				err = bpf_obj_do_pin_kernel(parent, \"%1$s\",	\n\
+							    %1$s_map,		\n\
+							    BPF_TYPE_MAP);	\n\
+				if (err)					\n\
+					goto undo;				\n\
+			", ident);
+	}
+
 	codegen("\
 		\n\
 		\n\
@@ -757,6 +821,19 @@ static void codegen_preload(struct bpf_object *obj, const char *obj_name)
 			", bpf_program__name(prog));
 	}
 
+	bpf_object__for_each_map(map, obj) {
+		if (!get_map_ident(map, ident, sizeof(ident)))
+			continue;
+
+		if (bpf_map__is_internal(map))
+			continue;
+
+		codegen("\
+			\n\
+				bpf_map_put(%s_map);			    \n\
+			", ident);
+	}
+
 	codegen("\
 		\n\
 			return err;					    \n\
@@ -767,6 +844,8 @@ static void codegen_preload(struct bpf_object *obj, const char *obj_name)
 static void codegen_preload_load(struct bpf_object *obj, const char *obj_name)
 {
 	struct bpf_program *prog;
+	struct bpf_map *map;
+	char ident[256];
 
 	codegen("\
 		\n\
@@ -800,6 +879,24 @@ static void codegen_preload_load(struct bpf_object *obj, const char *obj_name)
 			", bpf_program__name(prog));
 	}
 
+	bpf_object__for_each_map(map, obj) {
+		if (!get_map_ident(map, ident, sizeof(ident)))
+			continue;
+
+		if (bpf_map__is_internal(map))
+			continue;
+
+		codegen("\
+			\n\
+			\n\
+				%1$s_map = bpf_map_get(skel->maps.%1$s.map_fd);			\n\
+				if (IS_ERR(%1$s_map)) {						\n\
+					err = PTR_ERR(%1$s_map);				\n\
+					goto out;						\n\
+				}								\n\
+			", ident);
+	}
+
 	codegen("\
 		\n\
 		\n\
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
