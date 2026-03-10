Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCfHHV8ZsWleqwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:27 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2448225DCA6
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3939C9008D;
	Wed, 11 Mar 2026 07:27:26 +0000 (UTC)
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C943EC0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
 t=1773143723; bh=wq/KSwJcA3hqLetMFo3dTHFYxjONcw4I7Ih9VV1gllk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lEAp/s1FGs3gh/G3BwLm92E1HCxjGWlqxsQSbz/j1CB+Vlb/y59DpH7suq9qWHqSS
 sYNh9xzFzAwYyP3SKrKt2sCrYh94W00YkOJHULlnCDrzYXE+bJd6oNQ88ujEwWl/IW
 WDyVvJrtHTQ4L2Ennx46mVzCXGqAvMhY+uWIILEA=
Received: from [212.42.244.71] (helo=mail.avm.de)
 by mail.avm.de with ESMTP (eXpurgate 4.55.2)
 (envelope-from <phahn-oss@avm.de>)
 id 69b006ab-2367-7f0000032729-7f0000019cd2-1
 for <multiple-recipients>; Tue, 10 Mar 2026 12:55:23 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
 by mail.avm.de (Postfix) with ESMTPS;
 Tue, 10 Mar 2026 12:55:23 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:30 +0100
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-4-bd63b656022d@avm.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2748; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=wq/KSwJcA3hqLetMFo3dTHFYxjONcw4I7Ih9VV1gllk=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAXjBVZQh0oHFoS6hdf46zx6cg9yKqCoM11bV
 3iWUec0h4iJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAF4wAKCRA0LQZT0ays
 29vPB/9f5lFIt+0FtFBJpiKbUGS7UgY9T4E/E6CJ5zu/RqCe6vd531NLZdsmBEosrdFBBXDX57H
 sd8LCXF/sp89Zga6l1XIWkSIeHW4dDtT/UJNpkUGlvpmR4wd6cIocUQ2SKJZm2I5Ny799jzRqsU
 77XwGSzBy8rHgewt3q+d77K7620aLC+ceQfquSvw5IkT7R5aPt+VaJGvb/4d0wK060SD2e3AbrD
 KG5aPg5rty9abqBDIFiMe9sH7jc7Ssmy8RQOhQUuB/vX9zXXRZULMf0v4sI8el0Gl3lDI9uBnpn
 7EXyqizDRxBWqqlsbAFrtlRuPcNXRB2sNpMKxVhp0my3RZH1
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143723-7D482E1F-03DD7EA2/0/0
X-purgate-type: clean
X-purgate-size: 2750
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-Mailman-Approved-At: Wed, 11 Mar 2026 07:27:23 +0000
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, Theodore Ts'o <tytso@mit.edu>
Subject: [Linux-stm32] [PATCH 04/61] ext4: Prefer IS_ERR_OR_NULL over manual
	NULL check
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
X-Rspamd-Queue-Id: 2448225DCA6
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
 ists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-sctp@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-trace-kernel@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:netdev@vger.kernel.org,m:ntfs3@lists.linux.dev,m:samba-technical@lists.samba.org,m:sched-ext@lists.linux.dev,m:target-devel@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:v9fs@lists.linux.dev,m:phahn-oss@avm.de,m:adilger.kernel@dilger.ca,m:tytso@mit.edu,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[avm.de:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[56];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phahn-oss@avm.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[avm.de:mid,avm.de:email]
X-Rspamd-Action: no action

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Change generated with coccinelle.

To: "Theodore Ts'o" <tytso@mit.edu>
To: Andreas Dilger <adilger.kernel@dilger.ca>
Cc: linux-ext4@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 fs/ext4/fast_commit.c | 2 +-
 fs/ext4/mballoc.c     | 2 +-
 fs/ext4/namei.c       | 2 +-
 fs/ext4/symlink.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/fast_commit.c b/fs/ext4/fast_commit.c
index f575751f1cae430eead31afa4f7d03ade1099d4a..bc69ac1195acb823465e735572b8a21255d485f5 100644
--- a/fs/ext4/fast_commit.c
+++ b/fs/ext4/fast_commit.c
@@ -320,7 +320,7 @@ void ext4_fc_mark_ineligible(struct super_block *sb, int reason, handle_t *handl
 	if (ext4_fc_disabled(sb))
 		return;
 
-	if (handle && !IS_ERR(handle))
+	if (!IS_ERR_OR_NULL(handle))
 		tid = handle->h_transaction->t_tid;
 	else {
 		read_lock(&sbi->s_journal->j_state_lock);
diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
index 20e9fdaf4301b61c9d54401ed95067db6b6b8173..d7f004817c1ff758e4e25f84b2c27238b7420f84 100644
--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -2870,7 +2870,7 @@ ext4_group_t ext4_mb_prefetch(struct super_block *sb, ext4_group_t group,
 		    EXT4_MB_GRP_NEED_INIT(grp) &&
 		    ext4_free_group_clusters(sb, gdp) > 0 ) {
 			bh = ext4_read_block_bitmap_nowait(sb, group, true);
-			if (bh && !IS_ERR(bh)) {
+			if (!IS_ERR_OR_NULL(bh)) {
 				if (!buffer_uptodate(bh) && cnt)
 					(*cnt)++;
 				brelse(bh);
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index c4b5e252af0efbfcbaf83688a32d445327a74a02..4fdfc81f79028a588b3c1f912bff5e8a52cd9f13 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -723,7 +723,7 @@ struct stats dx_show_entries(struct dx_hash_info *hinfo, struct inode *dir,
 		struct stats stats;
 		printk("%s%3u:%03u hash %8x/%8x ",levels?"":"   ", i, block, hash, range);
 		bh = ext4_bread(NULL,dir, block, 0);
-		if (!bh || IS_ERR(bh))
+		if (IS_ERR_OR_NULL(bh))
 			continue;
 		stats = levels?
 		   dx_show_entries(hinfo, dir, ((struct dx_node *) bh->b_data)->entries, levels - 1):
diff --git a/fs/ext4/symlink.c b/fs/ext4/symlink.c
index 645240cc0229fe4a2eda4499ae4a834fe3bd3a66..b612262719ede35d2612c5834d2bef7f18215516 100644
--- a/fs/ext4/symlink.c
+++ b/fs/ext4/symlink.c
@@ -92,7 +92,7 @@ static const char *ext4_get_link(struct dentry *dentry, struct inode *inode,
 
 	if (!dentry) {
 		bh = ext4_getblk(NULL, inode, 0, EXT4_GET_BLOCKS_CACHED_NOWAIT);
-		if (IS_ERR(bh) || !bh)
+		if (IS_ERR_OR_NULL(bh))
 			return ERR_PTR(-ECHILD);
 		if (!ext4_buffer_uptodate(bh)) {
 			brelse(bh);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
