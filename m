Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +0IqNg/8VGqSiQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 16:54:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E4E74CA11
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 16:54:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b="Nt8P/dPq";
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=BK6fuQVX;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39653C7BF97;
	Mon, 13 Jul 2026 14:54:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5110DC7A83B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 14:54:05 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DCE4AK1561473
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 13 Jul 2026 14:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3CJJ/eHOj/g9LLGw/rjTjsJLWXJTAnetYTrtihNqHnU=; b=Nt8P/dPqInMsrXpi
 dlCDBMJQJzffvCbFXu8HxvCWfhNW7plselH09h1PpRF9ze7K24Nnok8hJOLAC86q
 XJ8ig9cfD9EUAlEDbpNidNqBua279ln77PStvNLQNrJAdOl6dBeCiXd59DJ+LPiX
 c77ipG65tx9+a2lgegLm/CRtblHxV5KK45yb5zUO4t5NngOfghrxluqSO/ZVF4ol
 ctlAXd+oncuPTfLvseM/tQPmljH8c8uh+8Dj4q8MJstnYmCJGFBR1THnZYzByzZ2
 Ihd5JEjkF7jOwehekW6pq3y0M94WIEhczJmDyQPNsl9a1YEGO8k9JPubq0up3zYV
 JSDbRA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3b402-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 14:54:03 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-455ce0bc783so1143398fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 07:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783954443; x=1784559243;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3CJJ/eHOj/g9LLGw/rjTjsJLWXJTAnetYTrtihNqHnU=;
 b=BK6fuQVXw5Z1jNN/nfkDlg7HMIR7KTGuYjREVgY5ZlCoPMTLcdyYs5mOib/U9G+ybd
 TwZGfYcZfHvnoLz2IvvGwVfn9UN5tvtCHO0n9W9RIF4kxy0rB6+qOZcRf5XSiC79fjDq
 TUQ3g/Qw0TIGJLCsuDfl6B75rLN3a6quiIb4NI8BH4dYcapviALaHJeuoMc9thIZaZux
 s/SEw60Q5FveVZ1/1RYpvxxojOtzytn7pVjhfb8TfygYZ0f65wDqISyPLEnUHfDN2nVQ
 3DrPFL3ASpeIm0Ocp6Awh9Fp8SDaHTPQIUz86QdH3yVc3fQJYh/BfKmIJYcrDwZSOnlp
 8giQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783954443; x=1784559243;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3CJJ/eHOj/g9LLGw/rjTjsJLWXJTAnetYTrtihNqHnU=;
 b=nkhAZvRmyipJmPGAqfcOEp8dxsTxNBXYUtTt1eaRuz9YV43LsLeZoRYXfV0ZJXlyzT
 B9/tv6op/vpMZAyNcj7tKEXcIHynjXqU4l5GA8fE/Z5qZzWtp1DoT33Qx1dunmN3bn12
 BNC7CagV52qfjnKmy5ichSslxj/rKl51ExW5h2mnrkIYK0tncao4T7gPamZaFl46i2LF
 70bc8thPutjEkL1OlXXI2YkvPHSKO4KoQKxt/ZR0DoGUA3OEkAqg6CPPKJx1v7Y+c4gr
 Y39es4DhZYaAyvaQdNSphQOx6J+CXzbN7LKZj2OiTNhjP/9U+fPWKHmsqHmM0g5ehJSd
 kxiw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/qKpVq0JAAYgVoZrBEXuYI22oCUQfCJ1HUmxBytpXuMStf5vkk41I/9YaPLPERybMvUke3FIgXSTOpeQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwjOWCXk3DN8NcKTyBZubRWzpRj9jsJbT8deHTZHNmMfBOihuBc
 ZnE9ZFHO8ehghd7CViddaWscfpMFKEJcPvuL/mVjfNvJWWe1RpkoE7jpKApkp52Q5M8Z6COUkrJ
 A68TlPt6DkKol97ZoKnEMVBIHN8p1nIHTMxcauupB4oTp+KeBpovtzXY5s/VPABVZHgPWtAa2FR
 NbZsF3KP0QNj/qGjs=
X-Gm-Gg: AfdE7ckydpzbT+5jrg+22EY96Hl/ySylln7nwRwzSk5Djz4cOfXX8L1HlGr/OXmZDjr
 fYbtYBN2zG8kyvBA45YvGLS31szdLYZBYxr+HKXpxzT99E4Ols7Bipuf2BHXvQ8o1Xwo0srRuZE
 +Hs4W+Ix2elc+EngOKjnkqUfC2z2icfRUrjAraPpjEio+FZkiFajGMCGfGhuzxXH8GUdE7lDCZh
 RKCcCf7+CEXJJKJncSbK66xQwVT/ywXeeXbWLg+yoWxq877hxtwzvB1xt5jpdKttnxzMQqNeBXD
 jGVNPOQuDXaNtYDRefr/Ubl8eb3veINtNfobA8q+5MOxUxZcyGkqS/hfvpBZqHFlBHJoYKTokLm
 atedtc3YQjWkwcC8hRpRnySXBeNqj14DP88w=
X-Received: by 2002:a05:6820:5710:10b0:6a3:7701:660c with SMTP id
 006d021491bc7-6a39a5c80camr3402667eaf.20.1783954442873; 
 Mon, 13 Jul 2026 07:54:02 -0700 (PDT)
X-Received: by 2002:a05:6820:5710:10b0:6a3:7701:660c with SMTP id
 006d021491bc7-6a39a5c80camr3402630eaf.20.1783954442465; 
 Mon, 13 Jul 2026 07:54:02 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 07:54:02 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:39 +0530
MIME-Version: 1.0
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-1-4d91bcef50eb@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX83MtTfKAcmIn
 +ILDz5uj7sA1FsH/6ZqBQaNPc42tp2FW7FccyBRn1ZRrBRz9kA8BeHZW0xGmsyVxirm0a961vZV
 lQvBhd6v0cwGjMpkJpzZ5ZhL8fDXaFe0WudlmaIEJ9/Eo8aW4OIfAUzHobE94EQ5tYzOPgxN0+a
 zGqDyEGPFo8J7dorQYicbkzbZN/eZqkAlB7zDgrv3RcJKFhrutqOhqYIpVy8tts8G3doOMxwqMq
 E2o9a9nTLMXcJctp66c9/ZZ4lgsMWAn1VLHk2p8Uv/l/rXtoxDXOu/5tfOSBmuljEMiPK1E65rw
 ktUuR6gQXj5Zl84+2C3iRS8ZfW3oNG+5rFZtihJUtgjQWIDErJHZoxsFU/JHDMrYR79M1202oO+
 +EcLS2wn1NlQUTmlPNBrQqzhRUYt2K7kOh6K7OVj5y+q6Tg5gJSKVLJg8VoqEJS6/56CRAMRk0j
 g/IDIQT07eQwco3ot8w==
X-Proofpoint-ORIG-GUID: BxvUEjG2-ygWXuAI55WVVHE7mi-23BHJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX3bl4WyuHG2oA
 1ICFe0ujWApJaHY5BWHZNFkBGGT4fhFp5zyLgGn0lRcUTjUnIBfF2QIkiRUcNDDnLky/fjjXgBa
 I1dN4vj/YmeZQRvDYvuJdDGh00izT7k=
X-Proofpoint-GUID: BxvUEjG2-ygWXuAI55WVVHE7mi-23BHJ
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54fc0b cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=90z41mPHMHFWLCXoM8oA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
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
Subject: [Linux-stm32] [PATCH v7 01/10] dt-bindings: clock: qcom,
 milos-camcc: Add missing power-domains support
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
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70E4E74CA11

The Milos camera clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented qcom,milos-camcc
compatible, this is an ABI break for any devicetree using this binding
without specifying them.

Fixes: dbb9d53b7197 ("dt-bindings: clock: qcom: document the Milos Camera Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-camcc.yaml   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index f63149ecf3e1b98e60dba27093737ec84b66a899..2295e7627ec9feb6a67f3ca952e6192a31cce593 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -25,9 +25,21 @@ properties:
       - description: Sleep clock source
       - description: Camera AHB clock from GCC
 
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
@@ -37,12 +49,19 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@adb0000 {
         compatible = "qcom,milos-camcc";
         reg = <0x0adb0000 0x40000>;
         clocks = <&bi_tcxo_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_CAMERA_AHB_CLK>;
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
