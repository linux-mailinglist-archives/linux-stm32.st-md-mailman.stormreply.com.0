Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 682A5CF22C8
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D701C7BF68;
	Mon,  5 Jan 2026 07:16:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 398B9C57A52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jan 2026 12:50:37 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6029Wc2g824910
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 2 Jan 2026 12:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Fp4+mJVKTQoSMQr4XwZyr06u9mVCIY8JRYJ
 cNq2XkTM=; b=kO+kmW0lNVd26lRH7eeO4vrCFpMkm3VdsG9TrpFeOIvLVYvXuLj
 lW78omeY+VGMmXCl3udEvj7JxFgTF9SI19bI4ItSgjLhRwFGNTuGwi7HtbodoZ96
 +gzAf72tSTeMbQvHUpign1x9gks310k89xww7rxTkoxyjsl1o6wTuBXkF+HT9lr2
 AOwCIzIT1OfC0pa50poVtLO034BCSlVovXiOlh0OBZ9NB17GOklwd5tzbLfiv7f0
 /0rXR9u3mn7jCHAfIVpjW5dUUf4VYODx+XgMd96uaWtCkD3zqkQtU0Rm+iXlGM1v
 bt7684Ls6CGWyClSF0StNBSWmlS6kNQbb/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533c1m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jan 2026 12:50:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f183e4cc7bso232928051cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jan 2026 04:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767358235; x=1767963035;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fp4+mJVKTQoSMQr4XwZyr06u9mVCIY8JRYJcNq2XkTM=;
 b=IQ9rL8NFzP9Uw7OwRyvFCszPLW+k5htmf2SoN51bGmdZ9QtxycbJLqM2OKy5Dcibox
 xRRdHLinWrg6awH5LAi4ZCz+RNWQPXbX1w6H2jYjRIko1ZDRXaU9KvFIZTaQOrs/ZQoB
 pc3BG6cCFXfDVWRxa/nH1J/idLFL3fwgtVgla0hZtqMwMmeLTFv6Pkg0yrASxpoKyXXY
 ernSuwTfgqUk0cNQY4vOvPplprmJ44zcf87qHjH1x/A+pJLc2ZhhH5dGqLCHw+vWm+83
 DDC60ORFs3FFEpc17EsyOTCaMUTi4sGH6fbtsK10Gx2rBMe/PnX9P6lfPWOSVbpLVi19
 AdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767358235; x=1767963035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fp4+mJVKTQoSMQr4XwZyr06u9mVCIY8JRYJcNq2XkTM=;
 b=eFpko0bK1rBCNvtVItVHMSlu8Nuek6GJXQyQ3zXTVG1G1GQ8Npjws56EWuJnsVRdq/
 PRMIq6E5G8B0IfeyA+b2rhQXxituJq5XXOrSKzuClTwR9BkNnzSVJeXTKfvlVdV7FYOT
 DZSUJOYDvnHCIQV3awVl5sCtDbdnOmeaAChzvqHHiQ/wdYAyQx6Bzk/O07Sa7gp+I4hT
 K8XZnDl+9gyCqnEKmA+w4lmAf0BMfKCmyjKUofstAg35ctHhtLxXWKK7NU9pOZ+svHUH
 IlCV3+WJnB8MvKXqnzqjjWOnVN7YGJk3qkFsCAtPehPH9J3aIAC2zm3Sf2L5OdnVQNW9
 YLTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmw0q0lQLy+n+MjeFGFzCyowmZGtvf3elpeb5U6Bf9x/Wj/ZM3Wz/qfebf6dtCbqRz0OBy6w+AcmASzQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzgJd+nAJskwmfI4lcA3uKlUeTnvwGuVhjCTVMiiCrqEeMaZyUP
 hCWTBHeyFX0nWGCkj1FcOIhfzAURywFhusTuFLZJ/Ld8n8FCqNfPwH6Ed8kaVkuMcMJRBmAwW8j
 CueZaQ3d/30LdvAw3yzEQH6Nejqz7WJxFpo7sCOKUjseiItDs1WfcII8Q0YTaOHvvF2okpyY3b/
 ozzgrto/8=
X-Gm-Gg: AY/fxX7ITpW0SqbEXBtoZrLdVVHiV2ngyib8VQ0ZG1l1PrnyZAzYc8VGJjvdyCJrRHc
 BZlhlqCEyZ5tfOZZWC+8SbceN1v+PkXpGV3xyTjlRq15GKxrLcGvG193IQAwJyb7s5UrZn2z5Mp
 zIl+OSb0OgDew/iHt5tRee/5jIWWQjv5VZSTU9R+29+90mgIz6awgzuQrSq/I8A7qtBho7sWsdv
 fHZw8Ngoh69qfM3GNLNIlp/wTQoA48bknVTOwLGDc9apzUDZ2zFIluXKUYoQT7yee+poChWRpfx
 2M95kiUJ0xrYRMgSCCo1Ug2u1nS8BuKCHFLZXJnZTTwcZZPbKMkRs4TSiXhu9ffFBmIKsKMmjai
 qjImfPY9PZHcj0qVEXhucJYw2SQ==
X-Received: by 2002:a05:622a:ca:b0:4ee:219e:e7b with SMTP id
 d75a77b69052e-4f4abdc6496mr664749081cf.77.1767358235597; 
 Fri, 02 Jan 2026 04:50:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhOqJewLADG+gjoDRNMsJwaKZguNA2D1Z8aonmvGmrKk0faqGUMW/pOTGdomDowabAEFPXCA==
X-Received: by 2002:a05:622a:ca:b0:4ee:219e:e7b with SMTP id
 d75a77b69052e-4f4abdc6496mr664748851cf.77.1767358235199; 
 Fri, 02 Jan 2026 04:50:35 -0800 (PST)
Received: from quoll ([178.197.218.229]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d19346dfcsm889545645e9.1.2026.01.02.04.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 04:50:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri,  2 Jan 2026 13:50:31 +0100
Message-ID: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=6VNzNxSib1wkBf9CiN0oOnbkb/ZpPRHIUAnKhtVhq3I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV78WJWOEQE1RlvmbLpGIzhsW70lWCb8Rfye3o
 cP203mpqqGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe/FgAKCRDBN2bmhouD
 11byD/46+NpegSknbhVdWe6q9ZcMwNzNNur4ERtJXs14JROinZOMIGkhhv0sG9IZmwuFjWvGjdX
 S8kM8GTYRxFbzvUwmjAgR2RpduZqOD4jXHXwB3p4Tl2oMBx36m3OP7yYjBs1Il7aNV1yOXFKwwK
 fckUpCVI9NxXQULZsYYVRiYkW7psB1LNwkgfaREvum03RSIFNOjOJWize2DF0lYOSAxyEhbCjEQ
 Rt1H6kJkXViUjlFxuuf32zsOI0oq8R4eW3V8N4iQ5dyVDRKrY3gqbo4SkT6srAxmjRRGFEgj3xn
 xTACmyMpsWVZ6vTzOenAV3it3qthTezkP/yZoaYywXFENtjLjhUvSnUXNppCTl9wcS1jqRo3cGW
 WL138RTvLXFsx/3u3Z39JmS83Euo/RgVVCnl1n3TmDzViTVYzwud4lGFOfYWvbOWRFimk0UaTGo
 gA6MwU2AbvHlixvLu0BvDhgS9jjep2su0U3VZfCFacbjPVzu/mX3Ek6JhPkJjXz44oK85ZY67yY
 qM+5bKnejU3CM7UiLcpATMhuRRpRUQvyIaU2faZ3/fz+xoSnfPVFRP2vRGlKH8sMEkQtaxS/X7Y
 /5qVLKkAB8FpEHky5pIVexTNZRVfJJlq90oWAlWai6mNQmTh62A6g9xM5hsRUY1cApwJCKgfTiK
 tSpbAD/9s3EJb/w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: YP0Nrde0-mzQ1xNg9xlA5IQgRitubx_R
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957bf1c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mc1TC-L5zOEaToRhIlkA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: YP0Nrde0-mzQ1xNg9xlA5IQgRitubx_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExNCBTYWx0ZWRfXyYe7IkIcYeQ4
 5DH/XG0GsgH+489qzTLtpggEOpwTNT97TDsg3QwHvAyJA4FQRo33hW3fUWCXxIMKBgUuxd6vIb6
 UNyu+zjWRFfuLEUDHK2KCgFbI/GR0MuAm1oaxi0bVCLael3DuAmf3HHwimB6gf1YTBQtIMMFHul
 w0aIKhWf3yBnKvMNN+804g+zmtRYqmuZh10VewJXeyNBbBsUqp0xNxPBzM29purYB3BWTKw6tgt
 fCipn6FKyeg+IQ+ZYe+XeLh6i6ZdPqT06Qp95odc1tJXKP5sdDFEW4w8kmYFrOKXkpX9Q33VXcX
 6YTu6fSCUby/L9O1Fbp38lcniANB9szT+ipD55RnsN8kX8NvidL6bMHGBKhkbtoFmowKoATA/qf
 VbXoDLsVHprncZha4IWSdayxrLoBc399FbNTTodfzA1EPj6Uo6QUYUlAlOBIfF6lnr7nNqva1dY
 1mlGB2uF0FcuU6pb+qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020114
X-Mailman-Approved-At: Mon, 05 Jan 2026 07:16:22 +0000
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [Linux-stm32] [PATCH 1/2] bus: qcom-ebi2: Simplify with scoped for
	each OF child loop
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/bus/qcom-ebi2.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
index c1fef1b4bd89..be8166565e7c 100644
--- a/drivers/bus/qcom-ebi2.c
+++ b/drivers/bus/qcom-ebi2.c
@@ -292,7 +292,6 @@ static void qcom_ebi2_setup_chipselect(struct device_node *np,
 static int qcom_ebi2_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *child;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	void __iomem *ebi2_base;
@@ -348,15 +347,13 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 	writel(val, ebi2_base);
 
 	/* Walk over the child nodes and see what chipselects we use */
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		u32 csindex;
 
 		/* Figure out the chipselect */
 		ret = of_property_read_u32(child, "reg", &csindex);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 
 		if (csindex > 5) {
 			dev_err(dev,
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
