Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 124DE67244B
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 17:57:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B561BC6904A;
	Wed, 18 Jan 2023 16:57:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4453C69048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 16:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674061027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kps1z9ixd0lDxco9/OkjAqqpIKVmg5Dst50L33D/YhY=;
 b=N2J4xJOg3en3lhV1LPq5xo0ukY8/IItclwi2gQOYSE17P65U7T95OTb/ZvOQAMkxHJx+b2
 F4Y3blHLaUMspHFKBOThMcDK1GDNZZNgJajKl033QhOeGDUssHV8Mf6sIz1aRqq7N45Ryz
 Iwm29qBhV5omos+ldXzop0x1d2w7uwA=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-524-TQ3999_qO3KPph1TdEW3TQ-1; Wed, 18 Jan 2023 11:57:05 -0500
X-MC-Unique: TQ3999_qO3KPph1TdEW3TQ-1
Received: by mail-oo1-f72.google.com with SMTP id
 k19-20020a4a3113000000b004f52d8ea37cso1364244ooa.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 08:57:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kps1z9ixd0lDxco9/OkjAqqpIKVmg5Dst50L33D/YhY=;
 b=XgRQkXO6imDGaF4wO7pi+gDO9HC+rSOGFgY2FEQ64D8KpqxDQ282qgXIt2QDw57iAr
 EJ6biU8hnHO1eMwUCaUkZ+EwELhZhd1ANHPP3m1VCGm/ChySpIshExfDEAjqsSNB5lW4
 cV4gS1ZP9jhR1qeylkbyKeJvOyk+8Iw1KWt43XHYFnonUJj6/Yd+uqm9VWXD1s91tI4L
 LA48RZbLbMmwkNaR45dBv1wPHFGbYS2uSkNSd/zYmJOkHK/52ygBIeopcN4A6ks2Oo7j
 ag8j0/Bn5DqhLPQqJfxvuTUhEkG4DcWVrN6InvUg//REO7Q5hpW840FJOCdEONRcB5vc
 2DDg==
X-Gm-Message-State: AFqh2kretj7+07F1cXEO83VvKh5fYJnQokq9LEcAlymFghE0klOBrJ9j
 /SKUURptXb4tI7yzRfeq6iuc6K/fxmp1UHguP76kx/pA2PNpnIHDUOcGmVOb5laBOEanXIdMwXz
 ttmv3ZzE+EZZ1Q6ur69ZeJyUgkeW51HVOUjnjZjer
X-Received: by 2002:a4a:1843:0:b0:4f2:8fa2:acda with SMTP id
 64-20020a4a1843000000b004f28fa2acdamr3678882ooo.5.1674061023633; 
 Wed, 18 Jan 2023 08:57:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXupkdVG/yfD1cPihjSS9PG73ekCsefEWVRwlr9j6832liTFaRdIJ5Wb9zlCzZCcuDSscvm3Sw==
X-Received: by 2002:a4a:1843:0:b0:4f2:8fa2:acda with SMTP id
 64-20020a4a1843000000b004f28fa2acdamr3678860ooo.5.1674061023348; 
 Wed, 18 Jan 2023 08:57:03 -0800 (PST)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a4a8d97000000b004a0ad937ccdsm6365174ook.1.2023.01.18.08.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 08:57:02 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
To: davem@davemloft.net
Date: Wed, 18 Jan 2023 10:56:38 -0600
Message-Id: <20230118165638.1383764-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Ning Cai <ncai@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>,
 vee.khee.wong@linux.intel.com, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org, edumazet@google.com,
 joabreu@synopsys.com, vijayakannan.ayyathurai@intel.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, michael.wei.hong.sit@intel.com,
 peppe.cavallaro@st.com, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 noor.azura.ahmad.tarmizi@intel.com
Subject: [Linux-stm32] [PATCH net RESEND] net: stmmac: enable all safety
	features by default
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

In the original implementation of dwmac5
commit 8bf993a5877e ("net: stmmac: Add support for DWMAC5 and implement Safety Features")
all safety features were enabled by default.

Later it seems some implementations didn't have support for all the
features, so in
commit 5ac712dcdfef ("net: stmmac: enable platform specific safety features")
the safety_feat_cfg structure was added to the callback and defined for
some platforms to selectively enable these safety features.

The problem is that only certain platforms were given that software
support. If the automotive safety package bit is set in the hardware
features register the safety feature callback is called for the platform,
and for platforms that didn't get a safety_feat_cfg defined this results
in the following NULL pointer dereference:

[    7.933303] Call trace:
[    7.935812]  dwmac5_safety_feat_config+0x20/0x170 [stmmac]
[    7.941455]  __stmmac_open+0x16c/0x474 [stmmac]
[    7.946117]  stmmac_open+0x38/0x70 [stmmac]
[    7.950414]  __dev_open+0x100/0x1dc
[    7.954006]  __dev_change_flags+0x18c/0x204
[    7.958297]  dev_change_flags+0x24/0x6c
[    7.962237]  do_setlink+0x2b8/0xfa4
[    7.965827]  __rtnl_newlink+0x4ec/0x840
[    7.969766]  rtnl_newlink+0x50/0x80
[    7.973353]  rtnetlink_rcv_msg+0x12c/0x374
[    7.977557]  netlink_rcv_skb+0x5c/0x130
[    7.981500]  rtnetlink_rcv+0x18/0x2c
[    7.985172]  netlink_unicast+0x2e8/0x340
[    7.989197]  netlink_sendmsg+0x1a8/0x420
[    7.993222]  ____sys_sendmsg+0x218/0x280
[    7.997249]  ___sys_sendmsg+0xac/0x100
[    8.001103]  __sys_sendmsg+0x84/0xe0
[    8.004776]  __arm64_sys_sendmsg+0x24/0x30
[    8.008983]  invoke_syscall+0x48/0x114
[    8.012840]  el0_svc_common.constprop.0+0xcc/0xec
[    8.017665]  do_el0_svc+0x38/0xb0
[    8.021071]  el0_svc+0x2c/0x84
[    8.024212]  el0t_64_sync_handler+0xf4/0x120
[    8.028598]  el0t_64_sync+0x190/0x194

Go back to the original behavior, if the automotive safety package
is found to be supported in hardware enable all the features unless
safety_feat_cfg is passed in saying this particular platform only
supports a subset of the features.

Fixes: 5ac712dcdfef ("net: stmmac: enable platform specific safety features")
Reported-by: Ning Cai <ncai@quicinc.com>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

RESEND: with some Intel folks on Cc this time as requested by Jakub!

I've been working on a newer Qualcomm platform (sa8540p-ride) which has
a variant of dwmac5 in it. This patch is something Ning stumbled on when
adding some support for it downstream, and has been in my queue as I try
and get some support ready for review on list upstream.

Since it isn't really related to the particular hardware I decided to
pop it on list now. Please let me know if instead of enabling by default
(which the original implementation did and is why I went that route) a
message like "Safety features detected but not enabled in software" is
preferred and platforms are skipped unless they opt-in for enablement.

Thanks,
Andrew

 drivers/net/ethernet/stmicro/stmmac/dwmac5.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index 9c2d40f853ed..413f66017219 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -186,11 +186,25 @@ static void dwmac5_handle_dma_err(struct net_device *ndev,
 int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
 			      struct stmmac_safety_feature_cfg *safety_feat_cfg)
 {
+	struct stmmac_safety_feature_cfg all_safety_feats = {
+		.tsoee = 1,
+		.mrxpee = 1,
+		.mestee = 1,
+		.mrxee = 1,
+		.mtxee = 1,
+		.epsi = 1,
+		.edpp = 1,
+		.prtyen = 1,
+		.tmouten = 1,
+	};
 	u32 value;
 
 	if (!asp)
 		return -EINVAL;
 
+	if (!safety_feat_cfg)
+		safety_feat_cfg = &all_safety_feats;
+
 	/* 1. Enable Safety Features */
 	value = readl(ioaddr + MTL_ECC_CONTROL);
 	value |= MEEAO; /* MTL ECC Error Addr Status Override */
-- 
2.39.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
