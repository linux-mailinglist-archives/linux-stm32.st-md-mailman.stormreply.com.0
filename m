Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ggFxJGwAK2oI1AMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:37:32 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 336B267479F
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:37:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=myaG+0Qd;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=IE1bx9A1;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E72AFC9AE37;
	Thu, 11 Jun 2026 18:37:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5C4BC424DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:37:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BIRao21349186
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 11 Jun 2026 18:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=; b=myaG+0QdAH82aYHA
 T5bzdiBz1N4/ZDU9K56o31TCPDJW2W2jDAyu14JVpgUhN47kE2/SBmuWvcfQ0++c
 Qy2VFuWc44xxX82ZYWraTV/silo5ycrPtjoGXzf+V+MhArRjVA3+dyc/K1uv2ZBn
 80pjbr8Im4NMVrgWQysarliG8Ss462jGwj61LHgm3Am4lFgqZSioS96vd5ZvrYPf
 lgTZYlVkI/0PaUMCJgGhLYFQAhi+VCUSjwofLEtJJAU6fHkq8zGXwBRQsmvSJFgX
 5lJgNrNTcjOZWucIA862/rGuDHVCq/Vr2rCYrRi/4OzioIMx109+gvLiBjI9U+T1
 cKiHug==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcg5wk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:37:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-84240b58211so124121b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 11:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781203047; x=1781807847;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=;
 b=IE1bx9A1rhYef5RSNCkoNX+jn+0bz+OvGmp1od9SHvOziOEYdoDFab5andRDyU5gF6
 z5Xar2Vs0VrWucxnUasDq8T40HcPtDOiOmpjVaJLMUADdQsoHQd/mbeWJgxMt4Vw5w/H
 GS/GhIyLeucl06ukWXF6rbtTld6nem4kmBqdlJqJ/otbe8/scWvO3IX72SrKNqDuyZvT
 lOapnPZikUAwaWpZd8+5cGumWn3lIoyaDUxEvW8PRtWZYda02U6k0Fop7jO9Y8bVArLG
 HazlXK5YSb8mDm+LPNCXV9X4kjVgMslQNwtJ8RZn9qoItm5ef+7dypoX2TtOTfebBRTf
 g0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781203047; x=1781807847;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=;
 b=CYoir5yN/o4ujhNsGLZmRPIjBDPjrK9elnv54hLxPOt6zcmyz1lbTVzmBLB3nGxiXI
 0zZoRkgfM5eieKrixlMO5TkW8KYEqZa6KhqJaWSFZWwpTgEbUWpSJbs/ypnerHnRUGQz
 VgmfuKDWmxIBMGQUG4VpC3JuzExSThKunweym/81eRIS72P+Ma/m0u10ZbfK9gYcoCuf
 zB6+eaPPIJ0Uh9+C7sL265mhG6BsRTXPixZn+2my83n4NXKXSVMI4QUZr+gEHF/B7iIA
 dPo5uojWhGo5wYQS6S2Kte7f8ZmvKtbcVULh7jzfijckhGkHObRczTqhbHBbHL30pEYZ
 Noow==
X-Forwarded-Encrypted: i=1;
 AFNElJ+iJEfgGcKFvoriAjtRJHgL+8TtQAxMYtGMHvVshk5dO80kMEI/cTK272NO4bc4bgSNbnBnA68oZ+pjhg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyd6VCBAv3aPtgoSfjwmsw8/U/PwEsh4fGrpGzTZm6Zlq7O8kX6
 esJybwXxP/bKfM4We75z+37mHc7w6lYGksMkGM5lAUFxDzZqQlAnIvuLlKsNjOsuC87bAZ/Rt79
 3YRV3ivtU3Xu6/hllYjRqC/75PP50tqP0/UWkmiFB2d42fnbh0Zr3iguQbybippnLyDog2og1t5
 8r5Stz7vzJ1q5cLviwAQ==
X-Gm-Gg: Acq92OEjGoKTsUvusZ4bJRZgvRWtHDM8feqE/5kWVTTzG8ci26vOjtTKIuDauPINYqB
 QE+yQc87dSGSFM9P+I4QyDI6VnxP0A++gkzwnGSUSta4xduOe6sOqybZLs1BaSnqcrKAo6l6FpN
 E8SN6VToALNvzpgJU039O2rbgoJ3lcZw6QZphEFSLa2xKQ6Q3qk0eT+SaOnSaAAj7dPH5p/fnUt
 UrzcoJTXlmEgU3jI/sREfgxBQi241BCGnoLvJ0ucNPcNnoIrNDHrnFFcjueo1ZA9NRoer8EFPEU
 UiFhPsjtyJfgjZMM+IZ5BBJ+3uxbeunUF/FLv4c8kzvexs1cAldJlZmKPjB6bJPydZogL9p5AVf
 rXx1VVW5r/AiQSidDNNWldS2zHR3L02gisMwvxY5p2JgJ6P1nnzg=
X-Received: by 2002:a05:6a00:12d2:b0:841:89a4:5f86 with SMTP id
 d2e1a72fcca58-84337076084mr4736766b3a.21.1781203047505; 
 Thu, 11 Jun 2026 11:37:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:12d2:b0:841:89a4:5f86 with SMTP id
 d2e1a72fcca58-84337076084mr4736731b3a.21.1781203046852; 
 Thu, 11 Jun 2026 11:37:26 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 11:37:26 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:06:58 +0530
MIME-Version: 1.0
Message-Id: <20260612-shikra_ethernet-v1-2-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=1852;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=5Xufs5yzw1meBpR74gkzyGtdf0gQ2cokHnunZolJSUI=;
 b=+3Ngf+LV00R14UIA4JhwZPvyrrFmhJx5fnVfVR/0VJFRrLoTMWjRw63LOhmMfCcRp1SypJ3B3
 GPEOoANmNeuDfd0CuXaKLK5vO4xXckMQdUVk/n+kSbWk0jfFTEb6Ddr
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX+armur/7jqZW
 qC2oyFq7EHDxZgkGFLxM0ouWbnMz6+3Q8DX4GbdxVtsjm2yPQTaTXio4DbCjN4PFNJPQ/BJl8jx
 HCV7sZwdu+1nGCOAvErlrCHT99koSpj4iIJI7Z63Ac5laGIgHY2rw67DfWPA6ZjRi8naP5g0LSY
 8PBqv0Inh4b1NC9Ktc1fZrg3bjsClVCnfRoMZrabpx7kDEgdHVdLrhJRYdxrTgZGKHGp3h22mV0
 fsk30Z//XKO3mMxO9FOlKpSBjGtjCXSoLYlJqxtWi7YtG5Sy6dai6QhGg6NDFlwZihmDqEwZDfV
 ZXSAQ4fLPAJQyCygcbCTW7usj4b/wbjBZDM6U1e/0ZMjKS4M33fOP8Spyyxl/+z6q9iOkiHDwj6
 nyJ2cUzCgepAoNmxGexnP/lKu76TkS9/T8DhQQYl0m0aEHQCGN8/FnEZXFUztZYWLr0dsT7K+5R
 8gNZgDJ9aoBRwMSHEUA==
X-Proofpoint-GUID: 42LZvE0U8IcnuPl85E73Dyv59NMVXVRy
X-Proofpoint-ORIG-GUID: 42LZvE0U8IcnuPl85E73Dyv59NMVXVRy
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2b0068 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=K6GgjFCvg-rKmMkbl2QA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX9R4+Q5n3jrQ3
 SjHXAyjP6l0kwrSaP3KZ/DHwXueMbbBFwm8rDLTEBjSA2CRT73e/J1AyAfRdgP1wg8I1/2mVDmI
 hVxf47ol6Rpz7HKiSTBVJAQUQbaLoj8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185
Cc: devicetree@vger.kernel.org, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 2/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:devicetree@vger.kernel.org,m:mohd.anwar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 336B267479F

The return value is never checked by its sole caller and the speed
validation duplicates a check higher up the call stack.  Convert to
void and remove the dead code.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..44270c25d874f72e7f971757fec659d36468c315 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -371,9 +371,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
-static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
-	struct device *dev = &ethqos->pdev->dev;
 	unsigned int prg_rclk_dly, loopback;
 	unsigned int phase_shift;
 
@@ -384,11 +383,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
-	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
-		dev_err(dev, "Invalid speed %d\n", speed);
-		return -EINVAL;
-	}
-
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
 	if (speed == SPEED_1000) {
@@ -479,8 +473,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
 		      RGMII_IO_MACRO_CONFIG);
-
-	return 0;
 }
 
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
