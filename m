Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A272A4F6E
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2019 09:02:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25542C35E04;
	Mon,  2 Sep 2019 07:02:14 +0000 (UTC)
Received: from mx5.ucr.edu (mx5.ucr.edu [138.23.62.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B58B9C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Aug 2019 02:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1567216818; x=1598752818;
 h=from:to:cc:subject:date:message-id;
 bh=9g/JKp5foaxieSnROfbCL0H+QjD7in4dyY/WHzgkS8M=;
 b=HPZ3ZPuOaThj5A4OXBhlaGW7Yxw58hOJtzdGhBTz3rPzzmexptrEeztc
 dBq0CRIne4QHWm5qL4kFfB1+ROAX2Ypafh5Icj9fKAQN8CkVgMG/QZQqh
 Yid0Z2fT/XkKEAfaUq0vhSNuUoapqOiU22ZLZnSnyI8wUAfoMeEM0cqsF
 ud9muGW7FL8bZmIBtDZX44WaB8An8Aod9KhjruRET2CCvHxZK923jaBaa
 dvh1lPfJQnOXhB8VcjuRPG51EJyO9HU5Fo/Q3+NrSYhE5pPjdd9OF3zpH
 DRtjmc9B66vJpLqQhxbTJ5BN3PpelZerwm95n9+ku7o9PX3Tx2fDNMQfi Q==;
IronPort-SDR: wDXxkbwtW08Hvh7102K8zw5EwIxTRG05RbLklpaZ+WfnhiyVExoLIC8BybkrkguVQP6P5CAutl
 XVPMcXyu3JStmHR9Qtt4CyzFArKfZE2L8XLDv44t8OejoRRPWxTRJBAeJWNSGD5wD1p9x4oioF
 /pdNoLhn4GcK77gMzkle19R6eQxHMluS1fza0eR+O+F3+4rYhRV6L7QfWJ9whxId812wrYY+Wn
 Za3oD+FBWsGlm8c2ujcNvGZ4TYqlx8ljC5fdyXHehutYeliE+2uC4ys4ixM1WKNAIxIp2z4D53
 CPc=
IronPort-PHdr: =?us-ascii?q?9a23=3AJHHZoxHNDIUD0N8R0qGBz51GYnF86YWxBRYc79?=
 =?us-ascii?q?8ds5kLTJ7zpsSwAkXT6L1XgUPTWs2DsrQY0rCQ6v69EjFbqb+681k6OKRWUB?=
 =?us-ascii?q?EEjchE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAA?=
 =?us-ascii?q?jwOhRoLerpBIHSk9631+ev8JHPfglEnjWwba5sIBmssAnct8kbjYRiJ6s/1x?=
 =?us-ascii?q?DEvmZGd+NKyG1yOFmdhQz85sC+/J5i9yRfpfcs/NNeXKv5Yqo1U6VWACwpPG?=
 =?us-ascii?q?4p6sLrswLDTRaU6XsHTmoWiBtIDBPb4xz8Q5z8rzH1tut52CmdIM32UbU5Ui?=
 =?us-ascii?q?ms4qt3VBPljjoMOiUn+2/LlMN/kKNboAqgpxNhxY7UfJqVP+d6cq/EYN8WWX?=
 =?us-ascii?q?ZNUsNXWixEA4O8dJAPD+sHPeZXsoLzuUIApgawBQmtGuzvziJHjWLy0aA0z+?=
 =?us-ascii?q?gtFAfL1xEiEd0TqnTZtNX7OrkPX+67z6fGyi7OY+9K1Trn9ITFaAwtre2KUL?=
 =?us-ascii?q?ltccTR004vFwbdg1qSqIzkPjOV1vkKs2OG6OdhVeOui249pAFwvjSj2skhh5?=
 =?us-ascii?q?LUho0J0FDI7zt2z5soJdChTkNwfN2qEINIui2EK4d7RtkuTmJotSog1LEKpJ?=
 =?us-ascii?q?62cDIXxJkjxRPTc+GLfomM7x75SuqcLzd1iGh7dL++nRq/80etx+vhXceuyl?=
 =?us-ascii?q?lKtDBKktzUu3AI0Bzc99aIR+Nm/kekxTaPzwfT6vxYIUwslarUNZohwrkom5?=
 =?us-ascii?q?oWq0vDHyv2lFzujK+Za0ko4+ao5/njb7jkvJOcOIh0igbxMqQqhMOzG/g3Mg?=
 =?us-ascii?q?8LX2SD+OS80qPs/VHhTblUkvE7lrPVvZPaKMgBuKK1Hg9Y3pw+5xu7DTqqyN?=
 =?us-ascii?q?EYkmMGLFJBdhKHlY/pO1TWLfH4DPa/g06jkDZ3y/zaMLDsGYjNIWTZkLv7Y7?=
 =?us-ascii?q?ly9lNcxBIpzd9D/5JUFq0BIPXrV0/1tdzYCAI5MgOtz+b8FNV9040TVXyUD6?=
 =?us-ascii?q?+CLKPeqFqI6f82L+mJfoAVuTL9K/0/6P7ol3M5gkMdfa6z3ZsScnC3AOxmI0?=
 =?us-ascii?q?GZYHb2ntgBFmIK7UIQVuvv3WyDQz5OYD7mTrA87zBjUNmOEIzZAI2hnerSj2?=
 =?us-ascii?q?+AApRKazUeWRi3GnDyetDBBK8B?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GHAQAl1Gldf8XXVdFmHgEGBwaBVAg?=
 =?us-ascii?q?LAYNXTBCNHYYPUQEBBosgGHGFeoMJhSSBewEIAQEBDAEBLQIBAYQ/gmMjNQg?=
 =?us-ascii?q?OAgMIAQEFAQEBAQEGBAEBAhABAQkLCwgnhUOCOimCYAsWFVJWPwEFATUiOYJ?=
 =?us-ascii?q?HAYF2FAWhLYEDPIwjM4hqAQgMgUkJAQiBIocfhFmBEIEHg25zhA2DVoJEBIE?=
 =?us-ascii?q?uAQEBjUCHFJYJAQYCgg0UgXOSWCeCMoF/iRo5il0BLaYJAgoHBg8hgTECgg1?=
 =?us-ascii?q?NJYFsCoFEgnqOLR8zgQiLXIJUAQ?=
X-IPAS-Result: =?us-ascii?q?A2GHAQAl1Gldf8XXVdFmHgEGBwaBVAgLAYNXTBCNHYYPU?=
 =?us-ascii?q?QEBBosgGHGFeoMJhSSBewEIAQEBDAEBLQIBAYQ/gmMjNQgOAgMIAQEFAQEBA?=
 =?us-ascii?q?QEGBAEBAhABAQkLCwgnhUOCOimCYAsWFVJWPwEFATUiOYJHAYF2FAWhLYEDP?=
 =?us-ascii?q?IwjM4hqAQgMgUkJAQiBIocfhFmBEIEHg25zhA2DVoJEBIEuAQEBjUCHFJYJA?=
 =?us-ascii?q?QYCgg0UgXOSWCeCMoF/iRo5il0BLaYJAgoHBg8hgTECgg1NJYFsCoFEgnqOL?=
 =?us-ascii?q?R8zgQiLXIJUAQ?=
X-IronPort-AV: E=Sophos;i="5.64,449,1559545200"; d="scan'208";a="73961681"
Received: from mail-pg1-f197.google.com ([209.85.215.197])
 by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2019 19:00:16 -0700
Received: by mail-pg1-f197.google.com with SMTP id o21so4903583pgd.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2019 19:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DDyvegdKp6MmZvQoeqYKTe4rMUcvHNSrG5Su6nBLcf4=;
 b=qprDHupaIojGNFgVP06c5kaz5rwic/6LQJDkaI5oGa6QBL1Zp1qvtQRXY1tWkYFvv7
 TkJ3jbSKQscENE4vdXbwXnfM85R/fiOCcUKxBuAVp6tvz20F6Q5KbJXHgy4gRwW2A4oX
 v6MwMB/Fwb8luE/DriVitnkeD0SUe/Z4m302X3MTN8UzBGRapVu8M/kXW28W4ySD9yia
 Ny3YZb4nGWJ8gPJEc/TcK3OcXtbq39BlLeKw4HWQHU1/7AEDTqF1tfL1k6VPdoPR0Fsp
 ttJu+EmtkKdNXJYKdx7flkhQtutFJSrRvUHdidQxcRivFEzhkqOANQHmb69pxbrQit4i
 IxSA==
X-Gm-Message-State: APjAAAW3yOHfgjXQ5wKX2bfDqN0f8pOejekEnzCgc7ONyD72xNKlriC4
 GK91w4FjY9+CaU0hX6keAR+mJZRI6vujwJnPAh2XqvjwczETpmU1DEbnt0u5+dyNHPiisYoKWRB
 sQq9EBVvRKO+3tXQr1fIKt/ID/0TaUpHx8ubzqAcfRw==
X-Received: by 2002:aa7:9495:: with SMTP id z21mr21413558pfk.220.1567216815848; 
 Fri, 30 Aug 2019 19:00:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2BLuGlLGxCSNkEHMBr+Frsk42bOM599GwK6aw54HDOsHA5LvdnFEX6NldgYdsc89eYIHNdQ==
X-Received: by 2002:aa7:9495:: with SMTP id z21mr21413519pfk.220.1567216815530; 
 Fri, 30 Aug 2019 19:00:15 -0700 (PDT)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
 by smtp.googlemail.com with ESMTPSA id 127sm7549594pfy.56.2019.08.30.19.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 19:00:14 -0700 (PDT)
From: Yizhuo <yzhai003@ucr.edu>
To: 
Date: Fri, 30 Aug 2019 19:00:48 -0700
Message-Id: <20190831020049.6516-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 02 Sep 2019 07:02:12 +0000
Cc: csong@cs.ucr.edu, netdev@vger.kernel.org, zhiyunq@cs.ucr.edu,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Yizhuo <yzhai003@ucr.edu>,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: dwmac-sun8i: Variable "val" in
	function sun8i_dwmac_set_syscon() could be uninitialized
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

In function sun8i_dwmac_set_syscon(), local variable "val" could
be uninitialized if function regmap_field_read() returns -EINVAL.
However, it will be used directly in the if statement, which
is potentially unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 4083019c547a..f97a4096f8fc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -873,7 +873,12 @@ static int sun8i_dwmac_set_syscon(struct stmmac_priv *priv)
 	int ret;
 	u32 reg, val;
 
-	regmap_field_read(gmac->regmap_field, &val);
+	ret = regmap_field_read(gmac->regmap_field, &val);
+	if (ret) {
+		dev_err(priv->device, "Fail to read from regmap field.\n");
+		return ret;
+	}
+
 	reg = gmac->variant->default_syscon_value;
 	if (reg != val)
 		dev_warn(priv->device,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
