Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 268D7CF4290
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 15:37:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF844C57B72;
	Mon,  5 Jan 2026 14:37:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7D86C57A51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 14:37:12 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6059cnwE610492
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 5 Jan 2026 14:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=FqozQF9M5zl
 w+9sgUgeqaaoOc0kHvJsMdTuoFXpVzqw=; b=hT+urKRWB2PgUU+9W9m2vd67RTD
 G5sZqtP03NPU8xe2O4uRbZbmhxuHsqrSqoO4sOtbmof6cVwcdbna8bnnm/z1BVhD
 lx3PFkOboTzXIUxtR2FJI/aYVujyVeca0KB8rPvN/UzG9j+zgDpTb+/huL0YiHOW
 qNT17fnob5oFSsL9MWzcLvwShr2r94b9UygBl2ZaHHtEj/PHWGeSzE/CxlDJ2Ucv
 PkrR8TQ4xvJ7q2jW79Pqc8ng03Aohpm+r7bPxoRHzvhSDoK5rwo74bAT+G9oR/Eb
 X6K3EuaI9FbQwldOaTCAf1J8yaZt6OjvdJgT4AKdLI65wJAWErdwj6QsOsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus0qty-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jan 2026 14:37:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed6855557aso52457451cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jan 2026 06:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767623830; x=1768228630;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FqozQF9M5zlw+9sgUgeqaaoOc0kHvJsMdTuoFXpVzqw=;
 b=QOqcBMyWPoicgr78Vb27tp3TvvZpI+I2N7BlWNxiAKZRPjeWeZW/JZO69W5QOBYmJE
 cW7KPO2Mhone1ZZF0NamHGILej2nC99D7blKgFB7uPAshKtu6mJPXt4FD6H3CmrZ9bas
 96v/wlk1CKuuO5pbY2OZW+mQMPnl6fwjfsrQRCc9hv0GWo6hLJBPpgW3lSchlKbbsgbX
 Upx8wLXM9h9+t2v2BLQ3BiHdl5oM7E/822bGdITyHwENkwOHp27NQdSQIvkUXqwoZZ27
 cGCDt7+XisoazSaWADUjQfmaezEh1k6jpVIe+lc2YKJqTaEvD7mDyigz30xbLZQCDrsV
 UO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767623830; x=1768228630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FqozQF9M5zlw+9sgUgeqaaoOc0kHvJsMdTuoFXpVzqw=;
 b=pReUb5ZiAlgCbnIjAzpSWpubimk3otAssWNA9KIJBd7lcLtQdubVGlsUz7gILr2Z7i
 Uoo65ICB8d0koPwzC1ONTCi/NWiYfydeqEkc5v95rYD4cvEBPKuPJwHRz3hOYFmAGwwn
 m01elD2K48u8+PV9XX/+H6Xup82i/XbSpCHiK6290W+hyzekVVkb+BqGVac5b/dPFLTq
 ZWA77lDc/gydQTqesR6NpnSLmmHbCEvo+BlIfhN56OW2JZi2F+quyYpkwtZIeIi9zsN8
 N2TjxK1RCv8X6F0UfMibE28YOy7FmNxZByYA0Ck8ikFRVLaxEwZuVeG3oh5NasRu0TM9
 jYUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXffLINr9B5D0jb7/g3ypCHMAnkuwQW1drT9O4Nka8DTvvQWJ55L3ZQFmK4Kz/XGdzPd54URxB7tGjc2Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzSf8thW0iXDyU8aKcIa7YrEG6YKvap2gcCM5EzwQ9bIC1w3/Rv
 hXykg+I+A/pHHA99tccvErOcHWCUvrVPfsNVUaR+HZNzGxjDla7x2YivaYtSAigAM/bJv6cAflG
 iJ/fLVvGjWkQTEBPc+1iDinSDmtjo9FsZlzmFBh2NBw84QzePXFjqGJ+MlWuWewfyo6IAYHErh4
 32Qe/uDPQ=
X-Gm-Gg: AY/fxX6qAZ1ytVWPv9Gc1OLwU55fUQ9OX0jK0p9q5QaVJJJkOK+NkwmzfZPbxVEj9ox
 oWLWXnZz+u49d7uPYE6SGQobhfJ0Gn8HsjmoSAC93TQpcsW3bQwKGYlNZP/3mDKqMvY43meFUYD
 WFbUOAVDhH0LttOVxPHOisishMn/m7JRsYIt1wapiwpPR5tg6bshCjlEW97676QvT8gOsYtc1tJ
 2GovVq4yRmIlemmUy6TRjyK718AIGikdRSv/EhmjBOj/vErAdBfTY3Ubt0N8pr2cQRmS+yVLjVb
 iW/pdf/9OvmGRJCjqQkzFTEvo5AjvaW0bQ4xwQ6Pe1lEsPkgMkBcQtJZOmPyFeuzenOA/kuS0YI
 Em6T/bliNb6UfMlCNfKoDK8rq8A==
X-Received: by 2002:a05:622a:40f:b0:4ed:a2dc:9e51 with SMTP id
 d75a77b69052e-4ff46b05e66mr102381911cf.21.1767623830085; 
 Mon, 05 Jan 2026 06:37:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJjWpZc2AHE030Ob1/BCoZ7+aZaco3pbYM4/m1iVzjjWTRyFsEiy5jveuZbG4ytMZcGxbzzQ==
X-Received: by 2002:a05:622a:40f:b0:4ed:a2dc:9e51 with SMTP id
 d75a77b69052e-4ff46b05e66mr102381391cf.21.1767623829493; 
 Mon, 05 Jan 2026 06:37:09 -0800 (PST)
Received: from quoll ([178.197.218.229]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b84267ba062sm2914066b.71.2026.01.05.06.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 06:37:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Mon,  5 Jan 2026 15:37:00 +0100
Message-ID: <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=JhtX/Jw0mKrE2rMCEG9hntzTYqIHi3SC7k8hVDUxXa4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW8yL/ba+hyOLq3Ya9b+2xC+hXQ9RLMEHV4Owj
 9LZU+4DabqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVvMiwAKCRDBN2bmhouD
 19uQD/0R9t/Sz6ycv5D28YQM7k6kABPNb9FjMVhuv7gGXPQ4VAxA/B8iZYtX6lCjaK5+BmF7d3h
 XrhlhtmK0HD5CAhdhNV7Ri2RixOpNXk9dNw6zAFog8FlcPZahMzIo4QT+wOlutTEWCdPK+W86bp
 1UerkQ74pVYKEjaB4gSO/gMFeSM1h4Jrmfa9aa7K6nTOOWXbSHC68m276IQ/1WLn0XdSVJGVrC0
 444dSX/teYoO8GFUN21SWIiDDBWNcRCIQ4aj1HnrNevjTnGqbnmqeRaeHHUpEghce6MIj/iC8Hu
 vzzsJAtynI6xDOe70/tFWbWQb3Evys3t6FNrvULVI/O8oDkYDjRZhdEOtTROmU8jwKPnK2RvQud
 jx7/I8N2RLRNMER/xIJ10OzPK8H4FpVqt16VYDalGUw55n19QNNYIXmHfu7ACFeM/iQ9jH/DHnX
 wy6LWfNqyQpzYCEWz3GFwPXcJTJqlIVRwxYaGVoESUIV30WD9XCvBq06DtsPD8oP3Hzi69LdrRw
 Ul+s9RgHzpF6liooHeDaHDZs4UeZpPnUdvwy28g+JWQ2k5RYM5nFaULfDXGXE5g5TOXtGqIUfkQ
 crp990mGt6mkGXi1r57MEGhLM3qnRkeDVBL3vn04sKrF+WFcjV4zrVQ90FkttV8V/r5Z/LWmSvg
 VEecn/h3toCBUdA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: y2lcnegygCnRaSuCX-TEgEDzS0BWWier
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695bcc97 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=vwHuHT9Ri9izzjm89PkA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: y2lcnegygCnRaSuCX-TEgEDzS0BWWier
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyOCBTYWx0ZWRfX6RBkWtFV2Y5O
 ScuAGeWMZEB8RzvClSB7owXLwUfunjP5B/pjZUtl3mpCdTCmisfbJ+R4gWag92v9RiTRMpbmYxw
 0yvSDsL9GhzIEjzhXXJx7KOei2rO2+IuMdj7I+UF7KRJzsMvLTslRZXfSxAqWGYqaBLN5JovthI
 CuhaZ0dY4PnId/HSb8zHk7q4pGbACxLni/ZNH0xY3ablCLhbFQpQe418a2N1fSFLOpHH8EcQbiy
 WTJtlYdUadqXMw2S6n86UldmNWUez84iXbz5kl9lhpGo+xu6SYEQjreJ9quScQHSwN3M7wSG6NW
 /wfaWxbNNB2MU48AmrFNcu9S/rn2AX7bmpaeuvYhhrSsazfgW2eJKseW4cU70TqCaADeJPOSaI/
 tCdr1hY6ivSHwcohIIWKf9x9gdeL+SLaqYv7+iydtEpAQ1iF16GkQY5nyN/JsEdKMYa2GtfyJEZ
 L7nYBD2SmHac5GVFkIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050128
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [Linux-stm32] [PATCH v2 3/3] bus: stm32_firewall: Use scoped
	allocation to simplify cleanup
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

Allocate the memory with scoped/cleanup.h to reduce error handling and
make the code a bit simpler.

Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 drivers/bus/stm32_firewall.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index fae881cea9a0..92414a4c7bb1 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -240,7 +240,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
 
 int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
 {
-	struct stm32_firewall *firewalls;
 	struct device *parent;
 	unsigned int i;
 	int len;
@@ -257,15 +256,14 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
 		if (len <= 0)
 			return -EINVAL;
 
-		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
+		struct stm32_firewall *firewalls __free(kfree) =
+			kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
 		if (!firewalls)
 			return -ENOMEM;
 
 		err = stm32_firewall_get_firewall(child, firewalls, (unsigned int)len);
-		if (err) {
-			kfree(firewalls);
+		if (err)
 			return err;
-		}
 
 		for (i = 0; i < len; i++) {
 			if (firewall_controller->grant_access(firewall_controller,
@@ -279,8 +277,6 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
 					child->full_name);
 			}
 		}
-
-		kfree(firewalls);
 	}
 
 	return 0;
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
