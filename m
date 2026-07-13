Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RQNVBBj8VGqUiQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 16:54:16 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A7174CA19
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 16:54:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b="ofQorq/F";
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=X8hIQJYQ;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 704F6C7BF97;
	Mon, 13 Jul 2026 14:54:15 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AAC6C7A83B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 14:54:13 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DCDVES1299269
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 13 Jul 2026 14:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CcYvGlNPYHGAbkj6uHtYNOFb0mvWGe8spTqM6tNVWI4=; b=ofQorq/FVZQXrf/h
 muej9Xe6JugH2Vf4rCykWBdZPw2WxMym6btcT0gpDG6bFDG8gfkJgb6deXkN+Knx
 VfYwOLAmOQUcDXWYuyMY9pJJDnE867w+Y+NdiH3HshdsZ0sTauLMy0XbFRBj1RUf
 Ph3TQIOIzvWdjkYNZJeZ2VKOXom4OA0npNi0JFL8R0omgOsSgPG9a4Rc1xysCsL8
 U1LrASJ1/QdMtzPqevW0ijYTF7LigMlPCMJyQ6kCTkRCM/03wBRkLvTCPynEcBwN
 EsXM7DqdwEgwlNV1mm9ICwQuNZ81keaml09aQz9bIJCwzcga6S5+mwaxraokTULm
 XH40AQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3h775-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 14:54:11 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-448bb8bd2efso5552829fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783954451; x=1784559251;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CcYvGlNPYHGAbkj6uHtYNOFb0mvWGe8spTqM6tNVWI4=;
 b=X8hIQJYQV/xfVPdvXbQgXSvxxmMgQil1C9baaugegqYtdNfpQI4Gf2PEw4DK8B9h2i
 eH6fELTjhSz2+2Advy+QnvGpxZCJ1CL3I/K3N8Mram+IIhbcP7gfkeyQe8Z0KW7FpJDr
 r5FpUmI0PHQtNPot6hJznG7mllFc2JQwSPwo6/UDL2x4AwgUmZXPFhR1dbuBM/cPin7/
 jyX8wssZVrid4ARS60gBUqeUr/tdj9+8d5+bo0qorFZ7p350Y+h6wlwT/nLvyKcXgvMO
 0Nau5ke5syBTQx42KXSAPGO6EH6PVUE+1eJcrMVX1kGGTM9NlnvUh+h9XKKBSrUx/gw6
 CFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783954451; x=1784559251;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=CcYvGlNPYHGAbkj6uHtYNOFb0mvWGe8spTqM6tNVWI4=;
 b=SU0jrTOSVz+WY1HV74VbOl87eqx+m8IyyK/enh+z/vBrEwukQ0E5sNRpMZrkBj7VCv
 YYvQMOPrJ1a75lD8LmQGCXNtq8+dnTwR74tsbiCHCo/the7NnAC53KnN/5u50iCSyu4M
 bOzv9ABKF4NZ0aFDo+ib6RRR8s9h3uI4sUiLSKTnXVgMbvJwYvT5bNbWSZond1T9ti0P
 cH5hu498DIiqO5CuHqjs3zf3AxRzV3NSr5jv1PJr1tRA47NFgj1NV/Hd+Fz7inGKXg5W
 kTrH3Q89WoBVFn40wBLDwX1P8yDc5FmqyECZu3LwSgcMlVsVN5DLbdSG7ayTiN/o4fkf
 rKBA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Q2tv/5HTfcpeZJZsrRikeV+9zxtDaW79AmvpX+/qdDgEA2hmyor4M9YauT1v1IkNPeNc1jtn0hwt+Zg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxbuyMTswzt/OTMRf2z4vnavDDJtD0MozF4EUIGUiHBbRX31vaB
 +eLCnMRLu4gWmYJ7WXqLYgI++pEvgxtDb669DMWACXnlWgl9IZzKrTRZLgfmPKnvSLi6fko1iQh
 N/5auGvKpOyv/+Uubnxmn3LY2XfC8vwKIZnX99tQC6ZWiIyLHF0EM+mibPxe/rfVuTPy3TXn65d
 51JrxiTenDWHazv3c=
X-Gm-Gg: AfdE7cl4+/dIO6/v8PdVQOuRvr852s0qlkfjl1ldZoY4KwZz/acZQZzvoED9k/xAN9t
 s0G7PbRR7cpBZGW6NlcdV6uSYOJLVnrf1GpWTDIpQG1oHhON7B3MgXQD+9ETEIoNzxeCvAdoYNT
 od2VsQ7Lu/pSFHFUamqKRRVUKxHuz0bsCdfFTSmxHcTZNdG4nEKuMLFLcqshkBohGi8uKkw9/12
 XoaI8b/8PhQay37GAz0VooVxBjDVVpZuJkS3e6Mt+4I00WKJ3TW1eMYaPqOyt4eLU8o5jDFvy9W
 VqAdu09DzAHIH49n6tjCp9CDYJgowBzcJgq5DN4WE4rOqI148eKynzoThBjzfviI4kYCHvJW2Yp
 UmTym4NSlWapVJOKCz9EcWPyfBPp26BepM3M=
X-Received: by 2002:a05:6820:98a:b0:6a0:e15d:7a with SMTP id
 006d021491bc7-6a39a54b726mr5693307eaf.1.1783954451009; 
 Mon, 13 Jul 2026 07:54:11 -0700 (PDT)
X-Received: by 2002:a05:6820:98a:b0:6a0:e15d:7a with SMTP id
 006d021491bc7-6a39a54b726mr5693280eaf.1.1783954450612; 
 Mon, 13 Jul 2026 07:54:10 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 07:54:10 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:40 +0530
MIME-Version: 1.0
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-2-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: rCQAkNpCuPFrxSO2U4tUcHd3cb_VdRsn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX3shuYW9cr/Z9
 Y81WCiG9LI77rPDm3jMzGI5DTzvkQ5iZl07E9c6aOl1tIqSCKLwI3ZX14qyvRZX151eRgq7h9Qm
 Xc2pbqztuOjvB6toGd7DjMyPC2JVPSs=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54fc13 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PEPMgF9El5tgKvQp_-EA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX7yCzRSdWVmda
 oEsDMMuQghy+wSMq0eg8o29UFhK/ozC8XCGklrL+Te8OKhuFu2EWzA1KkEDlUh7CdvFnPOAIByH
 cHQShgXY6Qm/LS/1w1ytb4e+1RRZWjSdu1IDLiGCg+X417krwooiyPvBRPORXKpYFhXl7TAby1k
 ri06ukL1BR4+QBq8Bqjb7ZhsdtfqyI+h2J14eXRbGCKNfMGljt9fzduySvUzkXOq6tcKeruX4zt
 QzaCWE+l8c/8Kp6mF9eDxlZ7lh8oTeUBt6c+vlQKBOCNqq0kOmG28NAO78Ji2PpMVXRUUnjOHUN
 ig4tkF2UdgedZr8+CRhr66fGEhXm/xf/O4RI1C47V5g3VOzaZImd4FfwAiX+JqXKgX72TpL9uPD
 2yMWCaKyd+jp2Z33fKsPuw09lq06t1WnpoBjFFr0WRTyyHTotFqytr4HoilchmY4cz1BXLLiHtx
 8DqKcKN00BYwy6I2yaQ==
X-Proofpoint-GUID: rCQAkNpCuPFrxSO2U4tUcHd3cb_VdRsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 02/10] dt-bindings: clock: qcom,
 milos-videocc: Add missing power-domains support
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
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com,oss.qualcomm.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3A7174CA19

The Milos video clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented
qcom,milos-videocc compatible, this is an ABI break for any devicetree
using this binding without specifying them.

Fixes: a4937e974186 ("dt-bindings: clock: qcom: document the Milos Video Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-videocc.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..4d8d109cd304ef0f5afc5c3fc7961a6156003d4b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -26,9 +26,21 @@ properties:
       - description: Sleep clock source
       - description: Video AHB clock from GCC
 
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  required-opps:
+    items:
+      - description: CX performance point
+      - description: MX performance point
+
 required:
   - compatible
   - clocks
+  - power-domains
+  - required-opps
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -38,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@aaf0000 {
         compatible = "qcom,milos-videocc";
         reg = <0x0aaf0000 0x10000>;
@@ -45,6 +58,12 @@ examples:
                  <&bi_tcxo_ao_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_VIDEO_AHB_CLK>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
