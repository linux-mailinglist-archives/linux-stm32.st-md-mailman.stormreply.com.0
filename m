Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CDA877CE9
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Mar 2024 10:35:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6342BC71281;
	Mon, 11 Mar 2024 09:35:34 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0FE5C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 09:35:32 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1dc1ff3ba1aso30290715ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 02:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1710149731; x=1710754531;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JFf08lEs3m84/dbvV4ZlLUOMjMFpJvm5xegIfbyJ9HU=;
 b=gvIu4BksmJHg0HiB+tSmVKLm/29wFMaUz1InrRS8PtY73cyHwxT0cm5RCMIq+Rhcxl
 suPGrXU9yxjwS3si6bKcpkP7HpB/yOPc1MPs42AF2AfRv5+sOMSM90MD1waMkjtViJFD
 JyFBqHR/yguf6ymy4gwQHQBbb/Zds7YYiobwgNr5ULnu/6Slg6PQPqu6M42lxuUJTCIh
 khK9WuQjxplGc10e6ueOqdu6IvY476rmFXHdYxyB59QkT9K7h6ETvvz2/MfzBdeZb8WV
 J/FpXzqRBepYXq6a5D4WT5Tva+tZ64vGlACNvGg8ssB7HrMYueWvvh9cy/5rdu3HrMHA
 Upww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710149731; x=1710754531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JFf08lEs3m84/dbvV4ZlLUOMjMFpJvm5xegIfbyJ9HU=;
 b=PqyKwOo521bosw4UzcA3oQ8XwmcS2M/ivng5P2ujKjLH91AxQJ2DFbEHVDL++P6Wbj
 dMUg509ujfoyEjDvVxhX02Nv+hLqyYifvcCFFWycr8ltzuw7kNdyFZgYbk7pzVoj8CDg
 3y7Efboruujnq/Wxv4s7BRf56MZpczr9BSFl7JDRihCSjcYvjNdNi1C7PA9h3zTvqLye
 zxHgaHpt5QiSN/c9kdarWMiGHlhjRCfhDsPbIZIS6a15lp538+rp7cTgUYuAg58XjygK
 EiswGirWXG0yxTnUytXu0aDUp9F5cZIRN4uMy+dOef91dCnBqhK78V4WQrP1LVPzbs7f
 A8eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXVr2uPbyBcuwRQHdbC2WYKxMYmYgVSEeM/9LSEM2b8GGKJAMapwM/VlWs1KLa3NtTqHApM+D7itydRkUnIbqt6jkCJpprJc9cK7LA2bY9SZ04i5PyjkVh
X-Gm-Message-State: AOJu0YwJU2BVpC0hxiAlq4oOrYccLvdcrf5wcnfgAm9iqbYSpNq1HGuE
 baGlKG4FLAxmkMY7vlKk8ehzHY911zb8lr+rHDDj8HQCeVblVtq/kbVC3kF3SaM=
X-Google-Smtp-Source: AGHT+IFQIVN/SFlbgP5cEEuZ7moW9KP5l9jB6qy51la06bqNfTxjZ7YG5WDDYrE2U6yDVhQ3L+9Yxw==
X-Received: by 2002:a17:902:988c:b0:1dd:772e:d504 with SMTP id
 s12-20020a170902988c00b001dd772ed504mr4091891plp.66.1710149729346; 
 Mon, 11 Mar 2024 02:35:29 -0700 (PDT)
Received: from localhost.localdomain ([43.129.25.208])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a170902f7c900b001dcad9cbf8bsm4253365plw.239.2024.03.11.02.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 02:35:29 -0700 (PDT)
From: Menglong Dong <dongmenglong.8@bytedance.com>
To: andrii@kernel.org
Date: Mon, 11 Mar 2024 17:35:25 +0800
Message-Id: <20240311093526.1010158-9-dongmenglong.8@bytedance.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
MIME-Version: 1.0
Cc: linux-kselftest@vger.kernel.org, dave.hansen@linux.intel.com,
 ast@kernel.org, song@kernel.org, sdf@google.com, yonghong.song@linux.dev,
 agordeev@linux.ibm.com, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Menglong Dong <dongmenglong.8@bytedance.com>,
 daniel@iogearbox.net, x86@kernel.org, john.fastabend@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, quentin@isovalent.com,
 borntraeger@linux.ibm.com, linux-trace-kernel@vger.kernel.org,
 rostedt@goodmis.org, kpsingh@kernel.org, mathieu.desnoyers@efficios.com,
 linux-arm-kernel@lists.infradead.org, haoluo@google.com,
 netdev@vger.kernel.org, dsahern@kernel.org, linux-kernel@vger.kernel.org,
 eddyz87@gmail.com, svens@linux.ibm.com, jolsa@kernel.org, bpf@vger.kernel.org,
 martin.lau@linux.dev, davem@davemloft.net
Subject: [Linux-stm32] [PATCH bpf-next v2 8/9] libbpf: add support for the
	multi-link of tracing
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

Add support for the attach types of:

BPF_TRACE_FENTRY_MULTI
BPF_TRACE_FEXIT_MULTI
BPF_MODIFY_RETURN_MULTI

Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
---
 tools/bpf/bpftool/common.c |   3 +
 tools/lib/bpf/bpf.c        |  10 +++
 tools/lib/bpf/bpf.h        |   6 ++
 tools/lib/bpf/libbpf.c     | 168 ++++++++++++++++++++++++++++++++++++-
 tools/lib/bpf/libbpf.h     |  14 ++++
 tools/lib/bpf/libbpf.map   |   1 +
 6 files changed, 199 insertions(+), 3 deletions(-)

diff --git a/tools/bpf/bpftool/common.c b/tools/bpf/bpftool/common.c
index cc6e6aae2447..ffc85256671d 100644
--- a/tools/bpf/bpftool/common.c
+++ b/tools/bpf/bpftool/common.c
@@ -1089,6 +1089,9 @@ const char *bpf_attach_type_input_str(enum bpf_attach_type t)
 	case BPF_TRACE_FENTRY:			return "fentry";
 	case BPF_TRACE_FEXIT:			return "fexit";
 	case BPF_MODIFY_RETURN:			return "mod_ret";
+	case BPF_TRACE_FENTRY_MULTI:		return "fentry_multi";
+	case BPF_TRACE_FEXIT_MULTI:		return "fexit_multi";
+	case BPF_MODIFY_RETURN_MULTI:		return "mod_ret_multi";
 	case BPF_SK_REUSEPORT_SELECT:		return "sk_skb_reuseport_select";
 	case BPF_SK_REUSEPORT_SELECT_OR_MIGRATE:	return "sk_skb_reuseport_select_or_migrate";
 	default:	return libbpf_bpf_attach_type_str(t);
diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
index 97ec005c3c47..63d4734dbae4 100644
--- a/tools/lib/bpf/bpf.c
+++ b/tools/lib/bpf/bpf.c
@@ -793,6 +793,16 @@ int bpf_link_create(int prog_fd, int target_fd,
 		if (!OPTS_ZEROED(opts, tracing))
 			return libbpf_err(-EINVAL);
 		break;
+	case BPF_TRACE_FENTRY_MULTI:
+	case BPF_TRACE_FEXIT_MULTI:
+	case BPF_MODIFY_RETURN_MULTI:
+		attr.link_create.tracing_multi.btf_ids = ptr_to_u64(OPTS_GET(opts, tracing_multi.btf_ids, 0));
+		attr.link_create.tracing_multi.tgt_fds = ptr_to_u64(OPTS_GET(opts, tracing_multi.tgt_fds, 0));
+		attr.link_create.tracing_multi.cookies = ptr_to_u64(OPTS_GET(opts, tracing_multi.cookies, 0));
+		attr.link_create.tracing_multi.cnt = OPTS_GET(opts, tracing_multi.cnt, 0);
+		if (!OPTS_ZEROED(opts, tracing_multi))
+			return libbpf_err(-EINVAL);
+		break;
 	case BPF_NETFILTER:
 		attr.link_create.netfilter.pf = OPTS_GET(opts, netfilter.pf, 0);
 		attr.link_create.netfilter.hooknum = OPTS_GET(opts, netfilter.hooknum, 0);
diff --git a/tools/lib/bpf/bpf.h b/tools/lib/bpf/bpf.h
index df0db2f0cdb7..e28c88d6cfa4 100644
--- a/tools/lib/bpf/bpf.h
+++ b/tools/lib/bpf/bpf.h
@@ -419,6 +419,12 @@ struct bpf_link_create_opts {
 		struct {
 			__u64 cookie;
 		} tracing;
+		struct {
+			__u32 cnt;
+			const __u32 *btf_ids;
+			const __u32 *tgt_fds;
+			const __u64 *cookies;
+		} tracing_multi;
 		struct {
 			__u32 pf;
 			__u32 hooknum;
diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index fd5428494a7e..821214774941 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -132,6 +132,9 @@ static const char * const attach_type_name[] = {
 	[BPF_TRACE_UPROBE_MULTI]	= "trace_uprobe_multi",
 	[BPF_NETKIT_PRIMARY]		= "netkit_primary",
 	[BPF_NETKIT_PEER]		= "netkit_peer",
+	[BPF_TRACE_FENTRY_MULTI]	= "trace_fentry_multi",
+	[BPF_TRACE_FEXIT_MULTI]		= "trace_fexit_multi",
+	[BPF_MODIFY_RETURN_MULTI]	= "modify_return_multi",
 };
 
 static const char * const link_type_name[] = {
@@ -381,6 +384,8 @@ enum sec_def_flags {
 	SEC_XDP_FRAGS = 16,
 	/* Setup proper attach type for usdt probes. */
 	SEC_USDT = 32,
+	/* attachment target is multi-link */
+	SEC_ATTACH_BTF_MULTI = 64,
 };
 
 struct bpf_sec_def {
@@ -7160,9 +7165,9 @@ static int libbpf_prepare_prog_load(struct bpf_program *prog,
 	if ((def & SEC_USDT) && kernel_supports(prog->obj, FEAT_UPROBE_MULTI_LINK))
 		prog->expected_attach_type = BPF_TRACE_UPROBE_MULTI;
 
-	if ((def & SEC_ATTACH_BTF) && !prog->attach_btf_id) {
+	if ((def & (SEC_ATTACH_BTF | SEC_ATTACH_BTF_MULTI)) && !prog->attach_btf_id) {
 		int btf_obj_fd = 0, btf_type_id = 0, err;
-		const char *attach_name;
+		const char *attach_name, *name_end;
 
 		attach_name = strchr(prog->sec_name, '/');
 		if (!attach_name) {
@@ -7181,7 +7186,27 @@ static int libbpf_prepare_prog_load(struct bpf_program *prog,
 		}
 		attach_name++; /* skip over / */
 
-		err = libbpf_find_attach_btf_id(prog, attach_name, &btf_obj_fd, &btf_type_id);
+		name_end = strchr(attach_name, ',');
+		/* for multi-link tracing, use the first target symbol during
+		 * loading.
+		 */
+		if ((def & SEC_ATTACH_BTF_MULTI) && name_end) {
+			int len = name_end - attach_name + 1;
+			char *first_tgt;
+
+			first_tgt = malloc(len);
+			if (!first_tgt)
+				return -ENOMEM;
+			strncpy(first_tgt, attach_name, len);
+			first_tgt[len - 1] = '\0';
+			err = libbpf_find_attach_btf_id(prog, first_tgt, &btf_obj_fd,
+							&btf_type_id);
+			free(first_tgt);
+		} else {
+			err = libbpf_find_attach_btf_id(prog, attach_name, &btf_obj_fd,
+							&btf_type_id);
+		}
+
 		if (err)
 			return err;
 
@@ -9149,6 +9174,7 @@ static int attach_kprobe_multi(const struct bpf_program *prog, long cookie, stru
 static int attach_uprobe_multi(const struct bpf_program *prog, long cookie, struct bpf_link **link);
 static int attach_lsm(const struct bpf_program *prog, long cookie, struct bpf_link **link);
 static int attach_iter(const struct bpf_program *prog, long cookie, struct bpf_link **link);
+static int attach_trace_multi(const struct bpf_program *prog, long cookie, struct bpf_link **link);
 
 static const struct bpf_sec_def section_defs[] = {
 	SEC_DEF("socket",		SOCKET_FILTER, 0, SEC_NONE),
@@ -9192,6 +9218,13 @@ static const struct bpf_sec_def section_defs[] = {
 	SEC_DEF("fentry.s+",		TRACING, BPF_TRACE_FENTRY, SEC_ATTACH_BTF | SEC_SLEEPABLE, attach_trace),
 	SEC_DEF("fmod_ret.s+",		TRACING, BPF_MODIFY_RETURN, SEC_ATTACH_BTF | SEC_SLEEPABLE, attach_trace),
 	SEC_DEF("fexit.s+",		TRACING, BPF_TRACE_FEXIT, SEC_ATTACH_BTF | SEC_SLEEPABLE, attach_trace),
+	SEC_DEF("tp_btf+",		TRACING, BPF_TRACE_RAW_TP, SEC_ATTACH_BTF, attach_trace),
+	SEC_DEF("fentry.multi+",	TRACING, BPF_TRACE_FENTRY_MULTI, SEC_ATTACH_BTF_MULTI, attach_trace_multi),
+	SEC_DEF("fmod_ret.multi+",	TRACING, BPF_MODIFY_RETURN_MULTI, SEC_ATTACH_BTF_MULTI, attach_trace_multi),
+	SEC_DEF("fexit.multi+",		TRACING, BPF_TRACE_FEXIT_MULTI, SEC_ATTACH_BTF_MULTI, attach_trace_multi),
+	SEC_DEF("fentry.multi.s+",	TRACING, BPF_TRACE_FENTRY_MULTI, SEC_ATTACH_BTF_MULTI | SEC_SLEEPABLE, attach_trace_multi),
+	SEC_DEF("fmod_ret.multi.s+",	TRACING, BPF_MODIFY_RETURN_MULTI, SEC_ATTACH_BTF_MULTI | SEC_SLEEPABLE, attach_trace_multi),
+	SEC_DEF("fexit.multi.s+",	TRACING, BPF_TRACE_FEXIT_MULTI, SEC_ATTACH_BTF_MULTI | SEC_SLEEPABLE, attach_trace_multi),
 	SEC_DEF("freplace+",		EXT, 0, SEC_ATTACH_BTF, attach_trace),
 	SEC_DEF("lsm+",			LSM, BPF_LSM_MAC, SEC_ATTACH_BTF, attach_lsm),
 	SEC_DEF("lsm.s+",		LSM, BPF_LSM_MAC, SEC_ATTACH_BTF | SEC_SLEEPABLE, attach_lsm),
@@ -12300,6 +12333,135 @@ static int attach_trace(const struct bpf_program *prog, long cookie, struct bpf_
 	return libbpf_get_error(*link);
 }
 
+struct bpf_link *bpf_program__attach_trace_multi_opts(const struct bpf_program *prog,
+						      const struct bpf_trace_multi_opts *opts)
+{
+	LIBBPF_OPTS(bpf_link_create_opts, link_opts);
+	__u32 *btf_ids = NULL, *tgt_fds = NULL;
+	struct bpf_link *link = NULL;
+	char errmsg[STRERR_BUFSIZE];
+	int prog_fd, pfd, cnt, err;
+
+	if (!OPTS_VALID(opts, bpf_trace_multi_opts))
+		return libbpf_err_ptr(-EINVAL);
+
+	prog_fd = bpf_program__fd(prog);
+	if (prog_fd < 0) {
+		pr_warn("prog '%s': can't attach before loaded\n", prog->name);
+		return libbpf_err_ptr(-EINVAL);
+	}
+
+	cnt = OPTS_GET(opts, cnt, 0);
+	if (opts->syms) {
+		int btf_obj_fd, btf_type_id, i;
+
+		if (opts->btf_ids || opts->tgt_fds) {
+			pr_warn("can set both opts->syms and opts->btf_ids\n");
+			return libbpf_err_ptr(-EINVAL);
+		}
+
+		btf_ids = malloc(sizeof(*btf_ids) * cnt);
+		tgt_fds = malloc(sizeof(*tgt_fds) * cnt);
+		if (!btf_ids || !tgt_fds) {
+			err = -ENOMEM;
+			goto err_free;
+		}
+		for (i = 0; i < cnt; i++) {
+			btf_obj_fd = btf_type_id = 0;
+
+			err = find_kernel_btf_id(prog->obj, opts->syms[i],
+					 prog->expected_attach_type, &btf_obj_fd,
+					 &btf_type_id);
+			if (err)
+				goto err_free;
+			btf_ids[i] = btf_type_id;
+			tgt_fds[i] = btf_obj_fd;
+		}
+		link_opts.tracing_multi.btf_ids = btf_ids;
+		link_opts.tracing_multi.tgt_fds = tgt_fds;
+	} else {
+		link_opts.tracing_multi.btf_ids = OPTS_GET(opts, btf_ids, 0);
+		link_opts.tracing_multi.tgt_fds = OPTS_GET(opts, tgt_fds, 0);
+	}
+
+	link = calloc(1, sizeof(*link));
+	if (!link) {
+		err = -ENOMEM;
+		goto err_free;
+	}
+	link->detach = &bpf_link__detach_fd;
+
+	link_opts.tracing_multi.cookies = OPTS_GET(opts, cookies, 0);
+	link_opts.tracing_multi.cnt = cnt;
+
+	pfd = bpf_link_create(prog_fd, 0, bpf_program__expected_attach_type(prog), &link_opts);
+	if (pfd < 0) {
+		err = -errno;
+		pr_warn("prog '%s': failed to attach: %s\n",
+			prog->name, libbpf_strerror_r(pfd, errmsg, sizeof(errmsg)));
+		goto err_free;
+	}
+	link->fd = pfd;
+
+	free(btf_ids);
+	free(tgt_fds);
+	return link;
+err_free:
+	free(btf_ids);
+	free(tgt_fds);
+	free(link);
+	return libbpf_err_ptr(err);
+}
+
+static int attach_trace_multi(const struct bpf_program *prog, long cookie, struct bpf_link **link)
+{
+	LIBBPF_OPTS(bpf_trace_multi_opts, opts);
+	int i, err, len, cnt = 1;
+	char **syms, *buf, *name;
+	const char *spec;
+
+	spec = strchr(prog->sec_name, '/');
+	if (!spec || !*(++spec))
+		return -EINVAL;
+
+	len = strlen(spec);
+	buf = malloc(len + 1);
+	if (!buf)
+		return -ENOMEM;
+
+	strcpy(buf, spec);
+	for (i = 0; i < len; i++) {
+		if (buf[i] == ',')
+			cnt++;
+	}
+
+	syms = malloc(sizeof(*syms) * cnt);
+	if (!syms) {
+		err = -ENOMEM;
+		goto out_free;
+	}
+
+	opts.syms = (const char **)syms;
+	opts.cnt = cnt;
+	name = buf;
+	err = -EINVAL;
+	while (name) {
+		if (*name == '\0')
+			goto out_free;
+		*(syms++) = name;
+		name = strchr(name, ',');
+		if (name)
+			*(name++) = '\0';
+	}
+
+	*link = bpf_program__attach_trace_multi_opts(prog, &opts);
+	err = libbpf_get_error(*link);
+out_free:
+	free(buf);
+	free(opts.syms);
+	return err;
+}
+
 static int attach_lsm(const struct bpf_program *prog, long cookie, struct bpf_link **link)
 {
 	*link = bpf_program__attach_lsm(prog);
diff --git a/tools/lib/bpf/libbpf.h b/tools/lib/bpf/libbpf.h
index c41a909ea4c1..9bca44d5adfa 100644
--- a/tools/lib/bpf/libbpf.h
+++ b/tools/lib/bpf/libbpf.h
@@ -790,6 +790,20 @@ bpf_program__attach_xdp(const struct bpf_program *prog, int ifindex);
 LIBBPF_API struct bpf_link *
 bpf_program__attach_freplace(const struct bpf_program *prog,
 			     int target_fd, const char *attach_func_name);
+struct bpf_trace_multi_opts {
+	/* size of this struct, for forward/backward compatibility */
+	size_t sz;
+	const char **syms;
+	__u32 *btf_ids;
+	__u32 *tgt_fds;
+	__u64 *cookies;
+	size_t cnt;
+};
+#define bpf_trace_multi_opts__last_field cnt
+
+LIBBPF_API struct bpf_link *
+bpf_program__attach_trace_multi_opts(const struct bpf_program *prog,
+				     const struct bpf_trace_multi_opts *opts);
 
 struct bpf_netfilter_opts {
 	/* size of this struct, for forward/backward compatibility */
diff --git a/tools/lib/bpf/libbpf.map b/tools/lib/bpf/libbpf.map
index 57642b78917f..94933898df44 100644
--- a/tools/lib/bpf/libbpf.map
+++ b/tools/lib/bpf/libbpf.map
@@ -414,4 +414,5 @@ LIBBPF_1.4.0 {
 		btf__new_split;
 		btf_ext__raw_data;
 		bpf_object__free_btfs;
+		bpf_program__attach_trace_multi_opts;
 } LIBBPF_1.3.0;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
