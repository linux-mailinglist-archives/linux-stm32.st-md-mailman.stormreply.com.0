Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPbXGmAZsWllqwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B0B25DCFE
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E111CC900A2;
	Wed, 11 Mar 2026 07:27:27 +0000 (UTC)
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41462C8F269
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 11:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
 t=1773143725; bh=lEmCou71DQIv3rJiH+2ZIvzOcBQ45/hCLHA8fjFTjEM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AHWaJPiBsL+GwFoetOExpKLG9cmnqvpt8xMBxHRmuFnKfjqJNAZAD1Wuu27hEzCjp
 yo/8LH57/iizP+bjiVmoMZwTMOiCMC/XLDqy5SSCcm+OQZZ/0iP8EPctZ2sQqxK7Ab
 XT9/JQSyTpsDOlLEGnKt3l1avwq96+RDdo3lipF8=
Received: from [212.42.244.71] (helo=mail.avm.de)
 by mail.avm.de with ESMTP (eXpurgate 4.55.2)
 (envelope-from <phahn-oss@avm.de>)
 id 69b006ac-2367-7f0000032729-7f0000019d40-1
 for <multiple-recipients>; Tue, 10 Mar 2026 12:55:24 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
 by mail.avm.de (Postfix) with ESMTPS;
 Tue, 10 Mar 2026 12:55:24 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:41 +0100
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-15-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2257; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=lEmCou71DQIv3rJiH+2ZIvzOcBQ45/hCLHA8fjFTjEM=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAYJfb+qOowLIkUmfJbwapQWgbBrCmoY2MGV1
 kQO676TIO+JATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGCQAKCRA0LQZT0ays
 264GB/0ePCsoEZ4dvusK/+59DK+nFUG4TMYrwfcQ9Aw8geb+nDTbFBXmGXKhwNE0FGNMoZ9u6w0
 6Z8ff6aHriAkc9Kt7Cgo70KOX6BjUy2bKgpnqJ9UCEmLABUocGsnikIoRM/S+kmqBXC+hSxD7sM
 X70l7rxeP1jyVHxWJrxfa6E/R35lI3vjpmjnsYcBxz/fgBeGY30s+ys1gafR9RwiFHF5/fl9jcb
 Y3J+3Pom6JCnaZYPGyS2UG84plp5l+rENGjhP2UWug9tGkZ5pwYbuR79z7QaUT6EEnR3YbR314t
 8SpG12KL4Vc7ZU5W2GsSc9E64021CyFWbNdSoNZGwreTwyp2
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143724-764F0E1F-76E75FCD/0/0
X-purgate-type: clean
X-purgate-size: 2259
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-Mailman-Approved-At: Wed, 11 Mar 2026 07:27:23 +0000
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Subject: [Linux-stm32] [PATCH 15/61] trace: Prefer IS_ERR_OR_NULL over
	manual NULL check
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
X-Rspamd-Queue-Id: 37B0B25DCFE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[avm.de : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[avm.de:s=mail];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[phahn-oss@avm.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:bpf@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:cocci@inria.fr,m:dm-devel@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:gfs2@lists.linux.dev,m:intel-gfx@lists.freedesktop.org,m:intel-wired-lan@lists.osuosl.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-block@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-ext4@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-modules@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-phy@l
 ists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-sctp@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-trace-kernel@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:netdev@vger.kernel.org,m:ntfs3@lists.linux.dev,m:samba-technical@lists.samba.org,m:sched-ext@lists.linux.dev,m:target-devel@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:v9fs@lists.linux.dev,m:phahn-oss@avm.de,m:mathieu.desnoyers@efficios.com,m:mhiramat@kernel.org,m:rostedt@goodmis.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[avm.de:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[57];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phahn-oss@avm.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[avm.de:mid,avm.de:email,goodmis.org:email,efficios.com:email]
X-Rspamd-Action: no action

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Change generated with coccinelle.

To: Steven Rostedt <rostedt@goodmis.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-trace-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 kernel/trace/fprobe.c                | 2 +-
 kernel/trace/kprobe_event_gen_test.c | 2 +-
 kernel/trace/trace_events_hist.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
index dcadf1d23b8a31f571392d0c49cbd22df1716b4f..a94ce810d83b90f55d1178a9bd29c78fd068df4c 100644
--- a/kernel/trace/fprobe.c
+++ b/kernel/trace/fprobe.c
@@ -607,7 +607,7 @@ static int fprobe_module_callback(struct notifier_block *nb,
 	do {
 		rhashtable_walk_start(&iter);
 
-		while ((node = rhashtable_walk_next(&iter)) && !IS_ERR(node))
+		while (!IS_ERR_OR_NULL((node = rhashtable_walk_next(&iter))))
 			fprobe_remove_node_in_module(mod, node, &alist);
 
 		rhashtable_walk_stop(&iter);
diff --git a/kernel/trace/kprobe_event_gen_test.c b/kernel/trace/kprobe_event_gen_test.c
index 5a4b722b50451bfdee42769a6d3be39c055690d1..a1735ca273f0b756aa1fcfcdab30ddad9bc51c5f 100644
--- a/kernel/trace/kprobe_event_gen_test.c
+++ b/kernel/trace/kprobe_event_gen_test.c
@@ -75,7 +75,7 @@ static struct trace_event_file *gen_kretprobe_test;
 
 static bool trace_event_file_is_valid(struct trace_event_file *input)
 {
-	return input && !IS_ERR(input);
+	return !IS_ERR_OR_NULL(input);
 }
 
 /*
diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 73ea180cad555898693e92ee397a1c9493c7c167..59df215e1dfd9349eca1c0823ed709ec7285f766 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -3973,7 +3973,7 @@ trace_action_create_field_var(struct hist_trigger_data *hist_data,
 	 */
 	field_var = create_target_field_var(hist_data, system, event, var);
 
-	if (field_var && !IS_ERR(field_var)) {
+	if (!IS_ERR_OR_NULL(field_var)) {
 		save_field_var(hist_data, field_var);
 		hist_field = field_var->var;
 	} else {

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
