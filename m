Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ECU+JWUAK2oG1AMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:37:25 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA5E674797
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 20:37:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=Y7RcbeXr;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b="PpYc/eKK";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD79EC9AE37;
	Thu, 11 Jun 2026 18:37:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 598FAC424DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:37:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BITeJt1404696
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 11 Jun 2026 18:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AyxmGXU7tCETamEQ37pkjmBcE0pG+FwQBF/uCJxPNaQ=; b=Y7RcbeXrUvc6Z1/b
 nZ4FOXt/Ipi+MICJydJ5E7HgxkF/zc0pd36ESrMyQty/5HKx8rB8q90epNh9ZSTY
 s4IRDgyOn/teB7YqIPL/M//AxaBn7tfmitVTFt6o6wx11Ppq6KMvwa50tc7kdHEA
 PzCzNUlz5hvFg9OUNq7uk53/2GlIPXUNIhRdO8s2JhsN1z//Uz74bi+bIVgxfdPC
 kYqX2AtCmhkc4mPU+zdTDmf5Zq+Pmm+ahs2XZP2NMgzf/uCGh1BD9NIF66np6GWJ
 nrqB6KGLHPt54PAJGeLQidsD+ixDwDVOv+DQqKs97+feaM0mBX9DW6MEOrNOjfL6
 YT82+w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbgcdw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 18:37:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-8423970cb30so120209b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 11:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781203041; x=1781807841;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AyxmGXU7tCETamEQ37pkjmBcE0pG+FwQBF/uCJxPNaQ=;
 b=PpYc/eKK/LNzjLfg2HUhtpeV/c4m30iKhxpuoCEpih6E31gibb4mC3AglWHJFDB0ej
 XpMP5yTDF4Rxb3fnxmJzEoRr5vmRvxjVEDrbuFJa38h7P4C7Of45Fw2ofzjuqfmFPc5J
 fow6qyMQL1+WOl4QXsTxXUKksUMe+2T9EEMtGhA5ld4TvitDThUvN6blB/+krFndfSof
 pjgr4CfbX25HJwCRJ6XZ4KcneUZWTc2eqxjLJW6LkBxUeF2pY0H8LSEty/k6DdPa6FkI
 KQllLhWfGG1LWSpRA7+2UDj02uhyj5W2kOYVmvCtUpgR1NoE63sCRpqoy452LExcPHKS
 Qc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781203041; x=1781807841;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AyxmGXU7tCETamEQ37pkjmBcE0pG+FwQBF/uCJxPNaQ=;
 b=Ox9fKYXEBpucQccW/Hs2UL4GVY5+EJ358Z3XvJssIW7YwTpoUIOwx1lPmoLGsbYrZh
 rbjXBj5itH5zQ+JBKmO4PUwXREtbJLTGcveiWJnew11X0CwjDKgOQ8tRDkPHbtr7Ib0p
 OBjw7oBFvt3pDhdy3v3y/4kqvHG/hfpQyQV76S1JwV3teep2RwJweI+qFmf4maPt7m3m
 n5+eRoUJ9oMBcUbwpq09Qm7cz8KrDWufwyhehcSHoEXc183VGpPRKf5bkSOX9Nk/WEBj
 r2SgzUFGXg2VzsCJBGNNrjC0Q2LPzDSGsnjoSOt7OzaUafaFvO7/v5Cv75YZGdi5ozo0
 hXGA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/HQh4Cm00rIHfM/TX38SX7adpwyd6u0LHlZofwRcw35SPnFy/oqOzQWX21eIw5PYCTWv19YqfjkkxOyA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxXlZJff+OU26D/1R03tIcb/L3lSyuqogsUqRNTPDkk9+oOPCkt
 2JTxSRtiQEyuFFFB7ZHsOjwP2lu5sR3Y4a/D3mK45VnkjtYusLJa22sX7V4r+r/snvM1rOlCvjQ
 QU6OHGTGrfUDD7Ojj0v1YBNGkcMtnpYwn9Tc9E5QRxuhKbiD94bzUAXwYP20T4204jEgfJ08Jm7
 zmhZn+CeSIKcS3A2oV1A==
X-Gm-Gg: Acq92OH77JSM5DPYT4ar9ePJ9wyVbdPQovivgGnCUG9SDyQwSJCRVgCenpU73uWgomM
 3uHUxCjeh4QlRAHz4CTfGhdl4FaUPA8IFvsq3jpFXrju1eWYrvG5DeEiVw2IcAMXyWNe3N7xh3a
 AF7eQRdFfr5+Q2RdRfK7fU4zXuBSl4IwspmoM8U674n6wW3XcluzB2wi3oEAFSV25ML9llyKZD8
 Je7ld9q3iXQDFnS/BBBrtw3bjmnP4bTXFluwspO9LUQjSeChMm+ROasfU6lmzYwmvT+ujvpeVb0
 BgQ1w679tClI51luqpnW+dBGE6hEnytZKqecgHsvDriu2JDbo+wb7fulPSc3IX8EatAxbG8PyQV
 PiCZSf26C00njBMMSVfs8SSGSBWPjHmCVWeZf3FD3iD0uIyYb1Dk=
X-Received: by 2002:a05:6a00:414d:b0:842:732c:568b with SMTP id
 d2e1a72fcca58-84336bc69f3mr4345815b3a.22.1781203040948; 
 Thu, 11 Jun 2026 11:37:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:414d:b0:842:732c:568b with SMTP id
 d2e1a72fcca58-84336bc69f3mr4345780b3a.22.1781203040445; 
 Thu, 11 Jun 2026 11:37:20 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 11:37:20 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:06:57 +0530
MIME-Version: 1.0
Message-Id: <20260612-shikra_ethernet-v1-1-f0f4a1d19929@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=2195;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=5T444QwrYmsTwO3v1gCqDgxdhU4Jck3L9IB07WNXPS8=;
 b=Y8TuyI8PC+fi6lUIQ3mPFu/M5131hg3c7XDWYgoxoDB1Fd/WfaGv9PKijnwpIL8ceTzv9YHRr
 3aHjmo3PKU6CzJz8jJBD+WK6JDJtkQlULNu5b5xAVGiJM0RbhvweZN9
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: GLSQJFmfhNBb_voX4XpFf8mj4CRz8mB7
X-Proofpoint-ORIG-GUID: GLSQJFmfhNBb_voX4XpFf8mj4CRz8mB7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX6Y9/Ntilly1v
 rhZ8WqlmdACWrxoFaGlyw6007vxrDcvsNsIiHcgC+40tnPn2Yi884imdfkFgirNCXEVjMgPOJD/
 gNwYge4MTPnzXaCozIebEAHSqEVtx0s=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2b0062 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=w-NwtAtCphaO0WLdcGwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfXyR0dFcy2OCVR
 hbbDjF0e6LUNC58XyR9cuTVQqO0kobwA24qCdnLZ9cxcN2gpRkMWVKIEfcrbWhv94McKUTWkaRA
 UCeG1iMTueyfc88FYOeg8Lf2CTGQvEqzcKe81aa907uK7NmNwFrDrh7p9aQdV/DQTC5sij1K/0o
 eUIx/4yB7yP6SN1hThc/ZHkzeuuy+gR0ClNMtTMKsznYYAMz8yufs/39yGoCbuucEIoadcsNxNK
 3gWR8x3BYssp5c1ZWocl/l/mrhAeAXhVu/GlJcJHfFPtjJR3msSx+PeYSlVk8wDB0ap4Rn6//P2
 MFvWsgJxbeBWJTxLLThuPtLqVj3x0iU4jYGFwZHid5WtqyncezJF3E9RxDCOSmOMqK4I9PrOmV0
 yCmtBPrN31Bb2fFfJrlwIeWtHPw7SSJDZCDW5rZ4ZluHpcDrrFOEegZk5uK+rvzZxyaT4hmzKx6
 AvHf9ed4fQnVsz1+AXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110185
Cc: devicetree@vger.kernel.org, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 1/9] dt-bindings: net: qcom,
 ethqos: add qcom, shikra-ethqos compatible
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
X-Rspamd-Queue-Id: 6CA5E674797

Shikra's EMAC requires three additional clocks beyond the standard four
(axi, axi-noc, pcie-tile-axi-noc) for NOC interconnect voting.  Add the
compatible string and extend clock-names with a oneOf variant for this
seven-clock configuration.

The AXI clock appears twice (as "stmmaceth" and "axi") because the
stmmac core and the driver's NOC bulk-clock array each consume one
reference; CCF refcounting makes this safe.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 31 ++++++++++++++++------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d945aa3e758a3c803d12bd61ec42b..4528946856c8c6e33bc6ad4159ed111f35ec37d9 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,qcs404-ethqos
           - qcom,sa8775p-ethqos
           - qcom,sc8280xp-ethqos
+          - qcom,shikra-ethqos
           - qcom,sm8150-ethqos
 
   reg:
@@ -57,16 +58,30 @@ properties:
       - const: sfty
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 7
 
   clock-names:
-    items:
-      - const: stmmaceth
-      - const: pclk
-      - const: ptp_ref
-      - enum:
-          - rgmii
-          - phyaux
+    oneOf:
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: ptp_ref
+          - enum:
+              - rgmii
+              - phyaux
+      - description: |
+          Extended clock list for platforms with AXI NOC clocks that require
+          explicit driver management (e.g. Shikra). GCC_EMAC0_AXI_CLK appears
+          as both "stmmaceth" and "axi"; CCF refcounting makes this safe.
+        items:
+          - const: stmmaceth
+          - const: pclk
+          - const: ptp_ref
+          - const: rgmii
+          - const: axi
+          - const: axi-noc
+          - const: pcie-tile-axi-noc
 
   iommus:
     maxItems: 1

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
