Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A414EA7EF
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 08:33:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9CABC628BE;
	Tue, 29 Mar 2022 06:33:00 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BB90C60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 17:52:29 +0000 (UTC)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KS0bf391Gz681p5;
 Tue, 29 Mar 2022 01:50:38 +0800 (CST)
Received: from roberto-ThinkStation-P620.huawei.com (10.204.63.22) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 28 Mar 2022 19:52:27 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: <corbet@lwn.net>, <viro@zeniv.linux.org.uk>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <kpsingh@kernel.org>,
 <shuah@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <zohar@linux.ibm.com>
Date: Mon, 28 Mar 2022 19:50:22 +0200
Message-ID: <20220328175033.2437312-8-roberto.sassu@huawei.com>
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
Subject: [Linux-stm32] [PATCH 07/18] bpf-preload: Generate preload()
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

Generate preload(), to pin defined objects. For pinning, use the
bpf_obj_do_pin_kernel() function, just exported.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 kernel/bpf/preload/bpf_preload_kern.c         | 24 -------
 .../bpf/preload/iterators/iterators.lskel.h   | 26 ++++++++
 tools/bpf/bpftool/gen.c                       | 64 +++++++++++++++++++
 3 files changed, 90 insertions(+), 24 deletions(-)

diff --git a/kernel/bpf/preload/bpf_preload_kern.c b/kernel/bpf/preload/bpf_preload_kern.c
index 8b49beb2b2d6..0869c889255c 100644
--- a/kernel/bpf/preload/bpf_preload_kern.c
+++ b/kernel/bpf/preload/bpf_preload_kern.c
@@ -5,30 +5,6 @@
 #include <linux/bpf_preload.h>
 #include "iterators/iterators.lskel.h"
 
-static int preload(struct dentry *parent)
-{
-	int err;
-
-	bpf_link_inc(dump_bpf_map_link);
-	bpf_link_inc(dump_bpf_prog_link);
-
-	err = bpf_obj_do_pin_kernel(parent, "maps.debug", dump_bpf_map_link,
-				    BPF_TYPE_LINK);
-	if (err)
-		goto undo;
-
-	err = bpf_obj_do_pin_kernel(parent, "progs.debug", dump_bpf_prog_link,
-				    BPF_TYPE_LINK);
-	if (err)
-		goto undo;
-
-	return 0;
-undo:
-	bpf_link_put(dump_bpf_map_link);
-	bpf_link_put(dump_bpf_prog_link);
-	return err;
-}
-
 static struct bpf_preload_ops ops = {
 	.preload = preload,
 	.owner = THIS_MODULE,
diff --git a/kernel/bpf/preload/iterators/iterators.lskel.h b/kernel/bpf/preload/iterators/iterators.lskel.h
index 4afd983ad40e..75b2e94b7547 100644
--- a/kernel/bpf/preload/iterators/iterators.lskel.h
+++ b/kernel/bpf/preload/iterators/iterators.lskel.h
@@ -448,4 +448,30 @@ static void free_objs_and_skel(void)
 	iterators_bpf__destroy(skel);
 }
 
+static int preload(struct dentry *parent)
+{
+	int err;
+
+	bpf_link_inc(dump_bpf_map_link);
+	bpf_link_inc(dump_bpf_prog_link);
+
+	err = bpf_obj_do_pin_kernel(parent, "maps.debug",
+				    dump_bpf_map_link,
+				    BPF_TYPE_LINK);
+	if (err)
+		goto undo;
+
+	err = bpf_obj_do_pin_kernel(parent, "progs.debug",
+				    dump_bpf_prog_link,
+				    BPF_TYPE_LINK);
+	if (err)
+		goto undo;
+
+	return 0;
+undo:
+	bpf_link_put(dump_bpf_map_link);
+	bpf_link_put(dump_bpf_prog_link);
+	return err;
+}
+
 #endif /* __ITERATORS_BPF_SKEL_H__ */
diff --git a/tools/bpf/bpftool/gen.c b/tools/bpf/bpftool/gen.c
index e167aa092b7f..fa2c6022b80d 100644
--- a/tools/bpf/bpftool/gen.c
+++ b/tools/bpf/bpftool/gen.c
@@ -701,6 +701,69 @@ static void codegen_preload_free(struct bpf_object *obj, const char *obj_name)
 		", obj_name);
 }
 
+static void codegen_preload(struct bpf_object *obj, const char *obj_name)
+{
+	struct bpf_program *prog;
+	const char *link_name;
+
+	codegen("\
+		\n\
+		\n\
+		static int preload(struct dentry *parent)		    \n\
+		{							    \n\
+			int err;					    \n\
+		\n\
+		");
+
+	bpf_object__for_each_program(prog, obj) {
+		codegen("\
+			\n\
+				bpf_link_inc(%s_link);			    \n\
+			", bpf_program__name(prog));
+	}
+
+	bpf_object__for_each_program(prog, obj) {
+		link_name = bpf_program__name(prog);
+		/* These need to be hardcoded for compatibility reasons. */
+		if (!strcmp(obj_name, "iterators_bpf")) {
+			if (!strcmp(link_name, "dump_bpf_map"))
+				link_name = "maps.debug";
+			else if (!strcmp(link_name, "dump_bpf_prog"))
+				link_name = "progs.debug";
+		}
+
+		codegen("\
+			\n\
+			\n\
+				err = bpf_obj_do_pin_kernel(parent, \"%s\",	\n\
+							    %s_link,		\n\
+							    BPF_TYPE_LINK);	\n\
+				if (err)					\n\
+					goto undo;				\n\
+			", link_name, bpf_program__name(prog));
+	}
+
+	codegen("\
+		\n\
+		\n\
+			return 0;					    \n\
+		undo:							    \n\
+		");
+
+	bpf_object__for_each_program(prog, obj) {
+		codegen("\
+			\n\
+				bpf_link_put(%s_link);			    \n\
+			", bpf_program__name(prog));
+	}
+
+	codegen("\
+		\n\
+			return err;					    \n\
+		}							    \n\
+		");
+}
+
 static int gen_trace(struct bpf_object *obj, const char *obj_name, const char *header_guard)
 {
 	DECLARE_LIBBPF_OPTS(gen_loader_opts, opts);
@@ -852,6 +915,7 @@ static int gen_trace(struct bpf_object *obj, const char *obj_name, const char *h
 	if (gen_preload_methods) {
 		codegen_preload_vars(obj, obj_name);
 		codegen_preload_free(obj, obj_name);
+		codegen_preload(obj, obj_name);
 	}
 
 	codegen("\
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
