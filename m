Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPjbBX+T+GnSwgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CDC4BD020
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A65FBC5F1F7;
	Mon,  4 May 2026 12:39:26 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30F75C8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2026 15:54:39 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-8b62ca1d28eso2336746d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 May 2026 08:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650878; x=1778255678;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVr8Clh+n9i4UIz8+5GUPFBuftN5UkiMGfqWWtAa7So=;
 b=u8+8rqTVvJDHljzxZ8OlGPwOvx9yql01QB1b+3T3KKP1ZpVISUYim9EJXlgBJrLnX4
 WrROM3praaNioEZQG8Iv14V0YMKZEWs3XJZlfp6/7RchZgorIzj8nxxJIO5IlLCn6WKZ
 PbaccHcOP0DvQz1F0oc5SkF4IUgziiozrC+hM9qojuW0dzK5mJj8CM7P2J4KODcTHQbw
 GNYNvlquZQTYE0yv1oavjExCUeARx0Kunwg6QMYJq31tOhUKDr/FnBnXM21ufPONw5R5
 spxQ7lWYBXsiJtfcdCHp8QeVAOT76FKMelodJ88t6EJNhnK9NqwHgOrL6S6YOVbsUx7T
 MFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777650878; x=1778255678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aVr8Clh+n9i4UIz8+5GUPFBuftN5UkiMGfqWWtAa7So=;
 b=mp/Nj4ZAUYxWefXBevmttKm7PIDFPfmOYFOjNDyafETWqMuXw7eHdbObEmasE5CLyo
 Y3hXkvBnekShioI7swIAg+mJDPEPwHxxbyMI9PXhg/N/Vl2V5x8qiSKA8hGds3HxP2br
 qSq46AE3llWPDvANcIM1ChMANZ5mWI2NveCos7vF6oh/m5vxZ6HmuXrL80TOGi8G+PsJ
 Rdn8fhP9z0VH3oKm9Cr2nuHj5uC6kQaVjMUVa/isWdtRKepXM9ox6jLz9ChcffvjTxYr
 SsbxdH9N2JOFWt+hXbOFlQVXczDz3w2TGTGwbqXMwk4k6PuwgrASJgkTmEB8EI0I0sbt
 7ENw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+nmR7pMfcCkVjKuQUTGxSqCclWvd9vsdypb9Ro89GIMZW47dx3o9lDP7bk0V11FNeK9rMFRq/3DdZ5Eg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyexasG+eStEuRzR+zmGry3XDLNrFf06KqUMfG7AVIFvOjE1hPy
 84kcRsQI5VlhjekA/yZF1Q7NYee1MTsnx5Tu1dQD+cJBUkV1y/d0I9dT5gG/4YEcsbY=
X-Gm-Gg: AeBDietTiVgvw5C46GgphOuUHpldMQGme6f/6YIJTRei4xVfSbNEsJypHm6uDV91dpx
 Lq4GUsR5ypeggeC3U8zDwkMIp7BCEiBUe9isRCbC0KNruXkKDM/XwhGhqp2lw6iGU2+6kLHt1QR
 dQneNrqjDrbCsWpO+LCJx65M1h/w1Tk1ID41KJrWj8zjRGN6iMt0uroQh81PLR06xhfMLzh78V0
 i3YhpOyuGikxcH8xwGQdZLjlz2Wky9tNVwkNIo9t4fBWwjU74UCU3lppnruF0zKY0jcNwbyTGzn
 Z/AOOMrqKU2+isInXOgmVOr2aOTbqC8rEESXLtFTkiRkDxz9NJQqrGvN1wUTPh/6xVgGf9KTyTS
 EVvL0481vT7QBXyStASMX3KtJ5jE1Z3coxGk+ncWYVxsmEeeVfaoXlGjt92o5Cro4ILKEmWh0K+
 6pgiQgXjE9nBRvlXCP+9ej0ZQDAJwlPGEwpR3AD1LcYlvsbH8CoxkwS02b8DF0/7dyPD4UJGRt3
 V/dOw==
X-Received: by 2002:a05:6214:483:b0:8ac:bb62:fe4a with SMTP id
 6a1803df08f44-8b665f02857mr1068856d6.5.1777650878062; 
 Fri, 01 May 2026 08:54:38 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2026 08:54:37 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
Date: Fri,  1 May 2026 10:54:11 -0500
Message-ID: <20260501155421.3329862-4-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260501155421.3329862-1-elder@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 May 2026 12:39:23 +0000
Cc: me@ziyao.cc, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 devicetree@vger.kernel.org, hawk@kernel.org, elder@riscstar.com,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, ast@kernel.org, linux-gpio@vger.kernel.org,
 wens@kernel.org, linux-arm-kernel@lists.infradead.org, inochiama@gmail.com,
 a0987203069@gmail.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, hkallweit1@gmail.com
Subject: [Linux-stm32] [PATCH net-next 03/12] net: pcs: pcs-xpcs: Preserve
	BMCR_ANENBLE during link up
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
X-Rspamd-Queue-Id: F2CDC4BD020
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[68];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:elder@riscstar.com,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:li
 nux-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.674];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]

From: Daniel Thompson <daniel@riscstar.com>

Currently the XCPS found on Toshiba TC9564 (a.k.a. Qualcomm QPS615)
is unable to operate at 1000base-X and slower with a PHY connected
using SGMII/2500base-X (in our case a Qualcomm QCA8081). The link
negotiates speed correctly but the MAC can't get any packets out.

This attracted attention to the ANENABLE bit and we observed that the
bit is currently set during config and cleared during link up.
Preserving the bit during link up allows the system to work as expected.

Perhaps I lack the imagination but I couldn't come up with any reason
why keeping the ANENABLE bit set would break things for other XPCS
implementations. Let's ensure link up sets the bit for SGMII interfaces.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/pcs/pcs-xpcs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index b2c84b7e1e113..1d62d5b31c61c 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1263,11 +1263,14 @@ static void xpcs_link_up_sgmii_1000basex(struct dw_xpcs *xpcs,
 					 phy_interface_t interface,
 					 int speed, int duplex)
 {
+	u16 an_enable;
 	int ret;
 
 	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
 		return;
 
+	an_enable = (interface == PHY_INTERFACE_MODE_SGMII ? BMCR_ANENABLE : 0);
+
 	if (interface == PHY_INTERFACE_MODE_1000BASEX) {
 		if (speed != SPEED_1000) {
 			dev_err(&xpcs->mdiodev->dev,
@@ -1283,7 +1286,7 @@ static void xpcs_link_up_sgmii_1000basex(struct dw_xpcs *xpcs,
 	}
 
 	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
-			 mii_bmcr_encode_fixed(speed, duplex));
+			 mii_bmcr_encode_fixed(speed, duplex) | an_enable);
 	if (ret)
 		dev_err(&xpcs->mdiodev->dev, "%s: xpcs_write returned %pe\n",
 			__func__, ERR_PTR(ret));
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
