Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55531125EDC
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Dec 2019 11:25:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DC33C36B0C;
	Thu, 19 Dec 2019 10:25:45 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69932C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Dec 2019 10:24:11 +0000 (UTC)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20191219102408epoutp01157ce3883ee0bccf8faabec637abc033~hvrljnMjG0491904919epoutp01q
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Dec 2019 10:24:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20191219102408epoutp01157ce3883ee0bccf8faabec637abc033~hvrljnMjG0491904919epoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576751048;
 bh=lNrhRejjZJSzCkKB4e9oz198En7AGkhdGjzwETzjwSA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=KRYEj2JzULwya/Lqwzr7vEUGg8ieaFAf3rPegr29B0PVUF3SyMCsP9klN81Hb1v0F
 ECc7o8e5so/QQv3UuwVcxFPji6Ab/CxyYfVztMOTNtOYbFxz8BKojI0vtLkS7M66Ta
 3ZaPRb8yNlIUrnHGCUZ5g5Hn6i5XMQy/gom60bkg=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20191219102407epcas5p1b5c225f18bdc03ded34454fd31c43f6f~hvrlMFaTh0414504145epcas5p1y;
 Thu, 19 Dec 2019 10:24:07 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 84.91.20197.7CF4BFD5; Thu, 19 Dec 2019 19:24:07 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20191219102407epcas5p103b26e6fb191f7135d870a3449115c89~hvrktDiNf1266012660epcas5p1U;
 Thu, 19 Dec 2019 10:24:07 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191219102407epsmtrp176085784dc461fe6da3d95f7ca863b62~hvrksUUAR2283122831epsmtrp1j;
 Thu, 19 Dec 2019 10:24:07 +0000 (GMT)
X-AuditID: b6c32a4a-781ff70000014ee5-d8-5dfb4fc75a10
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 41.F3.06569.6CF4BFD5; Thu, 19 Dec 2019 19:24:07 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
 [107.108.73.139]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191219102405epsmtip2fd5ad69fdeaf24c9021b65c50e814a81~hvri16nI00195201952epsmtip2W;
 Thu, 19 Dec 2019 10:24:04 +0000 (GMT)
From: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 19 Dec 2019 15:47:01 +0530
Message-Id: <1576750621-78066-1-git-send-email-p.rajanbabu@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleLIzCtJLcpLzFFi42LZdlhTS/e4/+9Yg6/PlC02PjnNaDHnfAuL
 xZFTS5gs7v35wGqx6fE1VovLu+awWXRde8JqcWyBmMXRjcEWi7Z+Ybf4/3oro8WsCztYLW6s
 Z7dYsPERowOfx5aVN5k8Ni+p9+jbsorR4+A+Q4+nP/Yye2zZ/5nR4/MmuQD2KC6blNSczLLU
 In27BK6MVZMa2Qs2clb8n7+QrYGxjaOLkYNDQsBEYsqyoC5GLg4hgd2MEmd3/mOBcD4xSmxb
 s5+1i5ETyPnGKLFnoQ2IDdIw6/htNoiivYwSSx5OYIJwWpgkbk1+ygxSxSZgKrFqTiMrSEJE
 oItRYteBOWCjmAUWMkm82GcJYgsLBEp82dbNAmKzCKhKbHlwhhHE5hVwl/j7dx0rxDo5iZvn
 Opkh7CNsEl9XaELYLhLvlz9ng7CFJV4d38IOYUtJvOxvg7LLJV5+Wgx2qoRAA6PEzInTGSES
 9hIHrsxhAQUAs4CmxPpd+hC38Un0/n7CBAkXXomONiGIalWJ9cs3QXVKS+y7vhfK9pDoubqB
 BRJCsRKT1xxhnsAoMwth6AJGxlWMkqkFxbnpqcWmBUZ5qeV6xYm5xaV56XrJ+bmbGMHpQstr
 B+Oycz6HGAU4GJV4eH+4/ooVYk0sK67MPcQowcGsJMJ7u+NnrBBvSmJlVWpRfnxRaU5q8SFG
 aQ4WJXHeSaxXY4QE0hNLUrNTUwtSi2CyTBycUg2MtgKXHZhlDwa5b13vK+t5rXEtX7X5Tr7X
 ew7NszL866pvqH72wbIZvV6pLjp/Ze68S2SMO/nw+ax77G4F710djOwEn1/0tnF5sT8yfi9j
 2IX+n1sWf2n97WqUfP33xaT8r2+W/q9/ZWM4PVXLN13UKDvgnulymb939sxRCtaffrOgpSe5
 TNpAiaU4I9FQi7moOBEANvs2axMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsWy7bCSvO5x/9+xBru6GS02PjnNaDHnfAuL
 xZFTS5gs7v35wGqx6fE1VovLu+awWXRde8JqcWyBmMXRjcEWi7Z+Ybf4/3oro8WsCztYLW6s
 Z7dYsPERowOfx5aVN5k8Ni+p9+jbsorR4+A+Q4+nP/Yye2zZ/5nR4/MmuQD2KC6blNSczLLU
 In27BK6MVZMa2Qs2clb8n7+QrYGxjaOLkZNDQsBEYtbx22xdjFwcQgK7GSV+LpzNBpGQlpje
 vwfKFpZY+e85O0RRE5NE98UtYAk2AVOJVXMaWUESIgJ9jBL/F/1hAnGYBVYzSexY08IEUiUs
 4C9x//4LFhCbRUBVYsuDM4wgNq+Au8Tfv+tYIVbISdw818k8gZFnASPDKkbJ1ILi3PTcYsMC
 o7zUcr3ixNzi0rx0veT83E2M4NDU0trBeOJE/CFGAQ5GJR7eH66/YoVYE8uKK3MPMUpwMCuJ
 8N7u+BkrxJuSWFmVWpQfX1Sak1p8iFGag0VJnFc+/1ikkEB6YklqdmpqQWoRTJaJg1OqgXGZ
 bP8snY0e68QWK7Kq80bprA/YcKM3K0EhI73gvVDxo8C5NWJ7Xtkm1P+t29F7+rRuwBYTFaPj
 zofvSPscrcgI8dwmEMrtHr+kz/LLI93mvh1ft9x/+CxVhi9i3qPoRzd36q9hXf/z4d8zlZEp
 Nz2X7hFOdXhuPm/yghOWrX9u/d+0Kt85+IASS3FGoqEWc1FxIgDJWKlXSQIAAA==
X-CMS-MailID: 20191219102407epcas5p103b26e6fb191f7135d870a3449115c89
X-Msg-Generator: CA
CMS-TYPE: 105P
X-CMS-RootMailID: 20191219102407epcas5p103b26e6fb191f7135d870a3449115c89
References: <CGME20191219102407epcas5p103b26e6fb191f7135d870a3449115c89@epcas5p1.samsung.com>
X-Mailman-Approved-At: Thu, 19 Dec 2019 10:25:44 +0000
Cc: Jose.Abreu@synopsys.com, jayati.sahu@samsung.com, rcsekar@samsung.com,
 pankaj.dubey@samsung.com, Sriram Dash <sriram.dash@samsung.com>,
 stable@vger.kernel.org, Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
 peppe.cavallaro@st.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH] net: stmmac: platform: Fix MDIO init for
 platforms without PHY
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

The current implementation of "stmmac_dt_phy" function initializes
the MDIO platform bus data, even in the absence of PHY. This fix
will skip MDIO initialization if there is no PHY present.

Fixes: 7437127 ("net: stmmac: Convert to phylink and remove phylib logic")
Acked-by: Jayati Sahu <jayati.sahu@samsung.com>
Signed-off-by: Sriram Dash <sriram.dash@samsung.com>
Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index bedaff0..cc8d7e7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -320,7 +320,7 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
 			 struct device_node *np, struct device *dev)
 {
-	bool mdio = true;
+	bool mdio = false;
 	static const struct of_device_id need_mdio_ids[] = {
 		{ .compatible = "snps,dwc-qos-ethernet-4.10" },
 		{},
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
