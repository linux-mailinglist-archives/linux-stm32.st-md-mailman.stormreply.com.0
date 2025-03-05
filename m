Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B64C0A4FF23
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 13:57:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A936C78F81;
	Wed,  5 Mar 2025 12:57:35 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 051A5C78F80
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 12:57:34 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250305125731epoutp01c0415f17e392dd15ca988ced4e4edf67~p6XxfMFF12619226192epoutp01q
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 12:57:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250305125731epoutp01c0415f17e392dd15ca988ced4e4edf67~p6XxfMFF12619226192epoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1741179451;
 bh=s/gtT1lET+EceP3+qrGo1lcUcIaDdCHOw1iDN9Hwc8w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=chUD6+7IzJiD2+mSdbegLmZF4CjZnQqsBm85H8YjA4vBvpVQrkVkETd7oZlGsVMpB
 yrGtJvqoedP0UWnLgya5y8wMq2HQp6G4cSxyV2IId05BfjsDXKN/5iGi/qFNt5wAYq
 vjZopuCQNkYNyfuYxXCCsyWa9jXt57WZjXcuUawQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20250305125730epcas5p3ff191251d017d4ad7028a2ee6d2dfa56~p6Xw5DyMv1709517095epcas5p3a;
 Wed,  5 Mar 2025 12:57:30 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.179]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Z7CJ85JWNz4x9Pq; Wed,  5 Mar
 2025 12:57:28 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 6D.97.19956.83A48C76; Wed,  5 Mar 2025 21:57:28 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20250305091856epcas5p4228c09989c7acfe45a99541eef01fbcd~p3Y7m3GmJ1060110601epcas5p4O;
 Wed,  5 Mar 2025 09:18:56 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250305091856epsmtrp12f0b8a21dff24fc2ea5c8f10a39e39f2~p3Y7lyz0K1941119411epsmtrp1Z;
 Wed,  5 Mar 2025 09:18:56 +0000 (GMT)
X-AuditID: b6c32a4b-fe9f470000004df4-88-67c84a3817b2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 EF.D6.18949.00718C76; Wed,  5 Mar 2025 18:18:56 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250305091853epsmtip2e87376224a2f9c39b68270730788a1b1~p3Y4zcjMv1567815678epsmtip27;
 Wed,  5 Mar 2025 09:18:53 +0000 (GMT)
From: Swathi K S <swathi.ks@samsung.com>
To: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Wed,  5 Mar 2025 14:42:46 +0530
Message-Id: <20250305091246.106626-3-swathi.ks@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250305091246.106626-1-swathi.ks@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WTe0zbVRTHc3+/viAr/uShFzYnljB5DGgH1FuBQRzOXxguJMRlEgxU+ksh
 lLZpiwrGbDhSpfJenNKwtSKIwJTR8eyA8CgPgSHQgrIMg4wlvCYgj2WbDEtb9L/Pufd7zvfc
 c+9l4a6DDC9WhlRFKaRCCYfhTGvt9/cLQnHDYm7Dkh96snwNoNr5djq62TWOocpf82lIZxqn
 o4eDC0w029OBoWXtHww00VpMR4YHM3RkNlYykGZmkY5u7P1ER4P6l9Du6BpAVS3bTPTnRicT
 mcaWcDRVUoah/c52JtpummXGeJDmmUmcbK6bxciHJS1MskM7xyT1hmzSUF/AIG9XXyI72rcw
 cr17mkEWN9cDsrebR24ZjiccScqMTKeEIkrhTUnTZKIMqTiKcy4x5UxKOJ/LC+IJ0Bscb6kw
 i4rixMYnBJ3NkFjPyvH+SCjJti4lCJVKTsjpSIUsW0V5p8uUqigOJRdJ5GHyYKUwS5ktFQdL
 KdWbPC73VLhVmJqZbtbUMeUWl0+uNuRjl0HvEQ1wYkEiDE59fw/XAGeWK3EHwLuPJpn24G8A
 q+q7MHuwC6C61Ew/TCnUabADdiW6AOy/m2MXbQO4aLrNONhgEH7wtx/bbKXciacAbpSP2kxw
 ohaDo/MW/EDlRrwFn49ft2awWDTCF/bt2xzYRATcMwxjdrdXYcOtHpvciYiEA70a2kEdSMyz
 4OPPnzDtoljYNL7kYDe4MtTsYC+4XKJ2cApsKJ6m2Tkdzj0tY9g5GvZYKmkHPeCEP2w0htiX
 X4Ffj/xs6wEnXGDRs0VHP2zYfuOQfeDe6oyjpCdsrVl3WJHQNF5Ot0+lBMCC6TxQCo5r/7fQ
 A1APPCm5MktMKcPloVLq4/+uLU2WZQC2Bx1wrh0szG8E9wGMBfoAZOEcd/bqyJDYlS0S5uRS
 ClmKIltCKftAuHV+ZbiXR5rM+iOkqhRemIAbxufzwwShfB7nZfaVjnyxKyEWqqhMipJTisM8
 jOXkdRnrZ8Sd8M1tU5xIqnnwae516Pl8ybi5qP/O0l38/ouXJsvlR/m76rqB2Ji0vWui6haL
 7sr9Y6HFq/SBouRUXuOye2Lb7AtJ64/Px1R8WWU+JhlOEw3t9J1cUTyKN56frBgpLMi7P6RO
 fM8vfEY+chHJTLVrboU7X7ndShZkGEsX/gksSmbv8LjNWEhtXPQH7kNNv0f8lak7XRa/GHB0
 zdfZPDZo2hQ821yZ7UlofMfjrPbtJm100P5mw9iE5cPOiz5rqncFxlOvTSllqVtq7ZmJC99q
 PkuYYH+jU38RFR3hk1rxg7c08Jccbc+cv+5enr7j9TurF26O6msKNxOrT7a54LmBHJoyXcgL
 wBVK4b9SEhIDWQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNLMWRmVeSWpSXmKPExsWy7bCSvC6D+Il0g/+T1C1+vpzGaLH8wQ5W
 izV7zzFZzDnfwmIx/8g5Vounxx6xW9w8sJPJ4uWse2wWF7b1sVpsenyN1eLyrjlsFl3XnrBa
 zPu7ltXi2AIxi2+n3zBaLNr6hd3i4Yc97BZHzrxgtrjUP5HJ4v+eHewWXzbeZHcQ9bh87SKz
 x5aVN5k8nvZvZffYOesuu8eCTaUem1Z1snlsXlLvsXPHZyaP9/uusnn0bVnF6HFwn6HH501y
 ATxRXDYpqTmZZalF+nYJXBmXu1ayF1zhq5i8uoWpgfEgTxcjJ4eEgIlEz/wupi5GLg4hgd2M
 EvPm3GCDSEhKfGqeygphC0us/PecHcQWEvjEKDHjXQSIzSagIXF9xXZ2kGYRgQ4miT1TTzKD
 OMwCG5kkjl3aDNYhLOAk8e/cXKCpHBwsAqoSh/6DDeUVsJb4u+kEE8QCeYnVGw4wg9icAjYS
 Rw92sYCUCwHVnPzJPoGRbwEjwypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k/NxNjOD40dLa
 wbhn1Qe9Q4xMHIyHGCU4mJVEeF+fOp4uxJuSWFmVWpQfX1Sak1p8iFGag0VJnPfb694UIYH0
 xJLU7NTUgtQimCwTB6dUA9ORBR2taTLesg2vFV6bvr9xQVt42pzvEzjX59o9k/nusq5IeSlz
 Z7WDoEbsd4aW5v8lm02ufa/UaujhurnkTv/8/VXTjpcpf/Kaff+Z0DT5T33Xps0qt+A7rmy8
 vWSBTCqjmp7zmz1KL8snb5T/9Orv/hcrpqz6F6ngEiAaUTtF+VmUsJxzFIe0+knxUxVndJcx
 6P/5Gdj8dJtmm1OsxotKRdbJDQI/4/WP5J7fnhhy2GdJxp3+xQFJ+8/6ac2v1lu+rnGVhZrh
 778f2F64X43sZDBuFD0qrsRhblB5IeTVcYFVlr+eFu3PXSTCcUR3orPyyy6+Te5/+9PzPF4G
 3T2VdCnv/iu7pE8XPVRDfZRYijMSDbWYi4oTAbJmoK0OAwAA
X-CMS-MailID: 20250305091856epcas5p4228c09989c7acfe45a99541eef01fbcd
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250305091856epcas5p4228c09989c7acfe45a99541eef01fbcd
References: <20250305091246.106626-1-swathi.ks@samsung.com>
 <CGME20250305091856epcas5p4228c09989c7acfe45a99541eef01fbcd@epcas5p4.samsung.com>
Cc: devicetree@vger.kernel.org, ravi.patel@samsung.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, swathi.ks@samsung.com,
 rmk+kernel@armlinux.org.uk, pankaj.dubey@samsung.com, gost.dev@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 2/2] net: stmmac: dwc-qos: Add FSD EQoS
	support
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

The FSD SoC contains two instance of the Synopsys DWC ethernet QOS IP core.
The binding that it uses is slightly different from existing ones because
of the integration (clocks, resets).

Signed-off-by: Swathi K S <swathi.ks@samsung.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 6cadf24a575c..e9038d015cf0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -325,6 +325,10 @@ static const struct dwc_eth_dwmac_data tegra_eqos_data = {
 	.stmmac_clk_name = "slave_bus",
 };
 
+static const struct dwc_eth_dwmac_data fsd_eqos_data = {
+	.stmmac_clk_name = "slave_bus",
+};
+
 static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 {
 	const struct dwc_eth_dwmac_data *data;
@@ -365,7 +369,8 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 	plat_dat->stmmac_clk = dwc_eth_find_clk(plat_dat,
 						data->stmmac_clk_name);
 
-	ret = data->probe(pdev, plat_dat, &stmmac_res);
+	if (data->probe)
+		ret = data->probe(pdev, plat_dat, &stmmac_res);
 	if (ret < 0) {
 		dev_err_probe(&pdev->dev, ret, "failed to probe subdriver\n");
 		clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->clks);
@@ -406,6 +411,7 @@ static void dwc_eth_dwmac_remove(struct platform_device *pdev)
 static const struct of_device_id dwc_eth_dwmac_match[] = {
 	{ .compatible = "snps,dwc-qos-ethernet-4.10", .data = &dwc_qos_data },
 	{ .compatible = "nvidia,tegra186-eqos", .data = &tegra_eqos_data },
+	{ .compatible = "tesla,fsd-ethqos", .data = &fsd_eqos_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dwc_eth_dwmac_match);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
