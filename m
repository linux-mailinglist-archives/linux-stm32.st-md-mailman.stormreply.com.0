Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1511FCF428D
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 15:37:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEBBBC58D7C;
	Mon,  5 Jan 2026 14:37:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC6F7C56612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 14:37:10 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6059l2cp091901
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 5 Jan 2026 14:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=HyfuLivv0oj
 zm7fZ5quMbz8PiyW8n+OAjsdu0D9Zt9c=; b=Rcx6WHlLnRR87CBh5EhFWBW75OE
 hmPh+MPavnUj8b+0ECUAp485HnYgKFOCE0fz2m6gd3I8kExjEq+y1J102K4z3d0Z
 7K+BEW0LL4fHTgez3ybN+uNxK5TiLmwSHfb7v+JJHGfVgM1YkFnQLTHYkUGgsvGJ
 XFIQRbxNsEFNVYqlokBbkL995BfNFOWHgx67paQlFo8j/teUdrlqSi8IZRyQAeG8
 fG7Y24iIimysv/Z1IX6spvynCVciFhN/9S8eQDdM/DKjchyeeqk6JO1EFihdr8FZ
 vYmVGGnoVUPhP54NzFZPuh4teJExyXE66GuFfw5nZqjnGkiw8q9Qih1WD9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg4v61snk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jan 2026 14:37:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b17194d321so1588915385a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jan 2026 06:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767623829; x=1768228629;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HyfuLivv0ojzm7fZ5quMbz8PiyW8n+OAjsdu0D9Zt9c=;
 b=ZSyf/WSODIiYFDk63RfRhyG1Hc8ypg9zrv9igoak4+2qmnPoOg8/JG4N+jnj3SeOiY
 mqEaYXtxehy/n0e0rUgiM9fz8DM+pl5PoWQ2+ZpiCPx3Bs9tBSSC4shd+y1askpFkuhH
 22F7M6RXXoIXkDDnsAgfY6P8zWWr1Xo/0U8aBJpQ1i65e7MUlQjZzDZiPg3WrMq5V84R
 2TD/iQiL8QrNIZ2sGHgwoUOS1FHbXAJinPj7caryDEyCOesA1fkZsCZIViv44x426Fkk
 lPYKvwMYjECzhWnC7yH1s5lYZbZ3aK7YtWagJFB7evIG0D/I28r3PB7dcHFcZYewB9U0
 PMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767623829; x=1768228629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HyfuLivv0ojzm7fZ5quMbz8PiyW8n+OAjsdu0D9Zt9c=;
 b=VJ+JoU4iqxHv/XszM7mQvAVBsh1kZNWeQiZKzMMN7UueCjpIKrji33VC5SCJ+octlT
 SXl+Zr0gzWwx4CjJzrJVrYKtB0a1SsKm3+SiG+Hhutoi2n2HxKzCpGhIGJ+5ziyJXLxN
 8Ncyh/aHspy1lj8dP9GW9WTUo4jt4+95q/6MTuYcQ44R6MSLI8CLMVllCvOnAZigGGck
 lIUQ+Zcx+T5S2MC/MLwL3MdHsvDZ+SAlSBzlCCesbksiAi4Fl0+hQc25ugYOKpxyD3dl
 PwbArjxSQ10sVtB5Bm4PBjasEj5J/y3R/ckGhar84WVLLPgjftUzSRKfHzkDlqtjzLRY
 PwuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgoqO/5R5DXDDHQNv3JOm/dlpvh4Dz6lPIfHPL0/41niFpCmRJJQu8aLdJTMV/j6VWxGq4m5vjIFe5HA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxuk6J+m1KSFaQDxd+s7IYIbTH1xfsAxAOvfOgXksmeUSxyVXPF
 3hWvOlCaZkRyo/aR8bxTUUXUBp48Gqi30rHZojJvLuoFivpvdX4YTfJ9uJZeLcNQ7gzYe+t+bK2
 AuRWTtnpt/r1J2yuFoJ3rF6JrZ9uxfVOUtX50GSLrmih+UHAq6wg/vlx9wxu58T31LxjEMDQdw0
 ggrWKbLXo=
X-Gm-Gg: AY/fxX4H0C+w9ZQdvecpAoARm+xik6gMI2qGXUKPyCfo5eviLkKjgyEt6M8fulCKlPF
 mBnYPuRzVj2+JU/OjEAm/Y9+uqzzStqubZ6C3q4FfzaVNVxOhDnXbW0PnGH2vbMhgbdAEpckGMz
 3H+2rsWdBApARtMDBEepz+nTwctBdOj3MHEdUmxJeTC+2cXrYP2/eFXF1s6UkB8Jx1QeGzEMebn
 ZhY3Db7cibkzCMJ+uBWYjdCSyImX4Zi3qv1NohqW/S68iTeewXzV40UDCgQLaAg+/18XEsTz0gM
 mApwcS+URJ3XVHkS3swQRFSfnEmue5AaWl6HyznwhgnQN/4+SOMuT9AldbK4xB9Hg3Gp7M1369s
 vjFDOms6MKpI0ii2pqc25N1ov0A==
X-Received: by 2002:ac8:7e8c:0:b0:4ed:e337:2e68 with SMTP id
 d75a77b69052e-4f4e18edb62mr524990021cf.81.1767623828583; 
 Mon, 05 Jan 2026 06:37:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlPyAVT02REUX2WWFLbiHvvDtYy4oVlLSayGGRdMm53toElZ+gdUshemsdZgp05CtUIgv12w==
X-Received: by 2002:ac8:7e8c:0:b0:4ed:e337:2e68 with SMTP id
 d75a77b69052e-4f4e18edb62mr524989561cf.81.1767623828049; 
 Mon, 05 Jan 2026 06:37:08 -0800 (PST)
Received: from quoll ([178.197.218.229]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b84267ba062sm2914066b.71.2026.01.05.06.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 06:37:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Mon,  5 Jan 2026 15:36:59 +0100
Message-ID: <20260105143657.383621-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=VWNI1jRoAcOtzMgRiNIx1nsy6FziB+nBMqILT49pY5U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW8yKK9tMDmS+zd0tePA6QT2rHsIHZg88Ymyoe
 Dk8w25ZEk+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVvMigAKCRDBN2bmhouD
 1+3rD/9zZs9oF90xAbOCMgh/+yckTfAbUBo5OCflXmVjKs2R8jj9P9tppyg+0WtpSxckQ2/loT2
 Bz4bdQug4tWNk77DYqF/78UUoiU+n4+MB76xQ52+v6kVidfukNewogJ3XbwWcLqI9bPLzveOXrN
 9qzurfXAqJHyA+QCQU2UPkGeBIGoLtSOO8T6rasnVPcFhL2vVDjyuPJsRGqrvwswQwKrCxo8Nt+
 9woqC8XBTtWsS9PMeNiJjMWKLMJzFihykyxlSWjKFOACfskhm3xwsUr6/EURdqePu7M32NZKr2x
 K6wtz9ZOW5af+wLTbfNwiXgjTa+qm4+Y2ogk9pCUm8bBhM1CsKLHVyJpSeb/pxLyaR+Xr74KZTQ
 L9E0Wj47K1PDu7RY7N/h6VNKDHrc3Nbg1RTaHsagk2rXRjxcMO9buEQm6UzG19y/1tSxsD+NmNT
 BD6Ez+IWf/uyKx2BEn2Pgx8QrEmezCDmfOOQx0oU8p8xsG7CwcoPw6VNosWn2gQ2BMZBXIH7kyp
 KGbVby9ANtxlGYmEt6QpxiH5J3Wc5CsNq1xyrKLZIe41a2vk3Hto5NfvbaiWvXcgm77WiegxhAK
 e3AupRZbgmjnIZ55D8DlyVcfl4N3OJGNCb/VZI/T9GxScXxLZiVd8MwbGc19X/Z/2E4PLt1WHQm
 rg+KWdcqIjrlHcQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyOCBTYWx0ZWRfX6jL4WVfRBbJB
 DUDz0BiTi0PvgCjFwgbbscps0YMjzy+fS8MiCXjqkzwU6qPL1UkZKxi522v7bLMwes2oqjJOqog
 cadwoZ7zn5CfwFXQyanXUInOgNsyGcTipP6JSg4cqJSDYHbsPB5NnZtnNGLXYMzPy9EnXJw9g8t
 fDhKY3IGID2n9sH2xoS7gl/38Pnxhi1C9ENa3livstLC7vBFjIF3anuKiX4EbpiCK/E6N9msdw/
 ZfePt6EH7ofdg+K4YL13OpfM9uYSIgs/4Am6v7qR2eWQr2hgUDleq2jNmK2Z8YsFqXXLfqWIY2s
 gicoXz/ihE78v2YhQTjOedcxG42xzbPppFzpUw+1NiQVX6I85WUcl9NZE1HWHaRhRDvr+jXfycP
 su6+hdWvRZvhkZs5uXNkmy1K1kF2wY1FTpG0H57VBRjV+ccn2A3tBhXcoqq6GYw9pLPkSBlZ/Mg
 LQJJDQiwPGyyBtsYxog==
X-Proofpoint-ORIG-GUID: upT70oNY-GgaR1Yv4FibPDSg0HqVV8of
X-Authority-Analysis: v=2.4 cv=c4ymgB9l c=1 sm=1 tr=0 ts=695bcc95 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=r8ysD5ROA9t2CGWeXHcA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: upT70oNY-GgaR1Yv4FibPDSg0HqVV8of
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050128
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [Linux-stm32] [PATCH v2 2/3] bus: stm32_firewall: Simplify with
	scoped for each OF child loop
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add Rb tag
---
 drivers/bus/stm32_firewall.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 2fc9761dadec..fae881cea9a0 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -241,7 +241,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
 int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
 {
 	struct stm32_firewall *firewalls;
-	struct device_node *child;
 	struct device *parent;
 	unsigned int i;
 	int len;
@@ -251,25 +250,20 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
 
 	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_controller->dev));
 
-	for_each_available_child_of_node(dev_of_node(parent), child) {
+	for_each_available_child_of_node_scoped(dev_of_node(parent), child) {
 		/* The access-controllers property is mandatory for firewall bus devices */
 		len = of_count_phandle_with_args(child, "access-controllers",
 						 "#access-controller-cells");
-		if (len <= 0) {
-			of_node_put(child);
+		if (len <= 0)
 			return -EINVAL;
-		}
 
 		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
-		if (!firewalls) {
-			of_node_put(child);
+		if (!firewalls)
 			return -ENOMEM;
-		}
 
 		err = stm32_firewall_get_firewall(child, firewalls, (unsigned int)len);
 		if (err) {
 			kfree(firewalls);
-			of_node_put(child);
 			return err;
 		}
 
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
