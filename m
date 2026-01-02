Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FC4CF22CC
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4356DC7BF63;
	Mon,  5 Jan 2026 07:16:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABD3FC57A52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jan 2026 12:50:39 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6029WOOY824754
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 2 Jan 2026 12:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Rw9cR7Ugnzn
 RgTLA61pO/jv9aIEOUeA5X2lpjfRbukE=; b=CCIzaNAk4aKy5RKneBlsANQYbM9
 GSLsbcAgZJSVPTziA/4aDpdAOtUHiva/4q1lkZrYnuxKWF8qduJmmsI7mJXgZbmP
 eKS9VulIZnKtSH1PxtXVpYsZ+pPBuVLw35DPmmgQUQeod/zRDqQNnGrYYVFLjPP7
 9ITQFNVUFBfWZGs9vsyAj813KqPSxf4vst4HR5QR4bhJDRpi/Ir9Bkpe8zE8uHFo
 lSpLtiIQNZKK6uemEEu3bnlLnqosZpXH40HENHmnHtb975Hg6YcxJmR7r0bcwMfz
 2Xv7LqN+ZmgB4K9q9SX7EO/1oD5CTzrWroSa6sHK4mNoUuHo/GCrPX7hEAg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533c1q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jan 2026 12:50:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4fc0d0646f9so77962141cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jan 2026 04:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767358237; x=1767963037;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rw9cR7UgnznRgTLA61pO/jv9aIEOUeA5X2lpjfRbukE=;
 b=fUhA5UQ2TBNJ+hVfFOFlL//gpghGDuIYdvpsJbq6MIlFcu6f5yMbr/5roODjvxS0/4
 RGw7iMtg5BZzua+iakbSRU3QU3fQlhJw6odFOTy5hNziL+DVu9OOOBYK93bhi5fp29Nt
 ZMqwpPh3CI4IODRApfexd1VZ+oEQYEgVDb+nl9ci0MrQYq/6ri5LF++uHj6B+vrSmz6Z
 8yrY1lFoLByrcNOAka7wpT/JiyN7N8WMpO5YX4FW2zimHDmzqmd8f693AAe/SsQjcTSJ
 76qlczNpVFzVXnkpqNwoFFAv0LfKY8YSO8qc/+G/BnP1IddR/1fRWDL2aUv9baKydOs2
 Xzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767358237; x=1767963037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Rw9cR7UgnznRgTLA61pO/jv9aIEOUeA5X2lpjfRbukE=;
 b=VytaB3NSFwvWbysWzIiVT41kqIcVdrCPqzyWsY/Lm2ANwtywAQ0A4gXPM/4km+kSjv
 arOMXGBRSosekmkgClsm2dmh5Ya8RpytAHxdR6k0pml4J3W1lcdy47mTCerPrBJuJ4e2
 zVQz290Nc/Swl2LB28FvBKU0r97KSO+A/JZg563DQwLE1z6YBMQ3ocNrKoH9lII9iAtL
 vcusIrHID1K5g3D4rjdqkkaP+LupxkWcmbTmlw065j3O1RDtda1HzmMCodrn28A67IBw
 lpE2tCLVfQDOaAQKl+ajc3cCqlIoSbe+Cejk6468Aj1TvCxFvb5Apv6ZV2lgoiy6iDjL
 XiLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUdQ8RNxpew4OJw/LTjrX+YxDlPNZ6AWfVrwk26NpSn/ArJYIREs3PEv+LiZwu4gJZVZtpYtcMS6pMSg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwSLR1neDms5LbIl7651HtIMpeYZFBeq9vmpDb4eMzBleC/PdHK
 b5w2XJLuIU+GL+udm7klo9n3aUToebgimtExGvTUG5vjkNI0yZp0fHmQp+GD0CViLlt2v4dFYQg
 /W1srTLswhmknm7bz7feLKNqmf4mfVpFv59AL5bpRdRoEcxjJAGhwFF6zjwMlviCWxVvOA4U+Z9
 KoqnxGYn7DqimWNmM=
X-Gm-Gg: AY/fxX57BMhAgwzSNdVP8YRhSLoq7eQVqVsa3zhv4VIWlWgvjjqr9AvJA+Cj+XJ/MNb
 24Ycm4Qe8Ds6z+IClOv7C8OiAVIQLKId2FxnEyKNlBYPxT8U7+IIINYOUUz7euI22IH0glYhgSJ
 EsXn6mhkJpZimPlZIug29S3ILl7e57d+biyoq5GJ5vKM9AqnuZrhCqYrWuhy6PGqZJKbgAZco5a
 W1zyJKCFg94G9j0wZ5gnq6qDKQDT2/s8DJgTL8lMQ3Xj8iFC6Xf7Dite3aBqXuvAgdyfdUKbYGQ
 lZaNP/dJPqfRLCDncZtjccGJ2F1FYnCLSrydOFKQkZ1YPkoQLvFMcgwQ5UTIt5226Gnt9Sm+9V5
 ID7qpzeS/a+6HN5eupMJEfBcfSg==
X-Received: by 2002:a05:622a:59ca:b0:4ed:bad6:9fac with SMTP id
 d75a77b69052e-4f4abcb884cmr674846771cf.1.1767358236833; 
 Fri, 02 Jan 2026 04:50:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIWw0MdhBU4+og+j+xA5tAQD4PqhfRubUFGra/1emxWwHiSIQQApB/teNuq8Qqq8FHeEdaMg==
X-Received: by 2002:a05:622a:59ca:b0:4ed:bad6:9fac with SMTP id
 d75a77b69052e-4f4abcb884cmr674846521cf.1.1767358236453; 
 Fri, 02 Jan 2026 04:50:36 -0800 (PST)
Received: from quoll ([178.197.218.229]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d19346dfcsm889545645e9.1.2026.01.02.04.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 04:50:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri,  2 Jan 2026 13:50:32 +0100
Message-ID: <20260102125030.65186-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=L5mPpkKO4ljRUS48r8o9ogYKNB6v9jDL+jvK6L4cQxw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV78XkJFsI1Cuiz5O917DM2/TgG4Rk+GqB/JPx
 xxyk2caXiuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe/FwAKCRDBN2bmhouD
 19m6D/9/zEO8ErTsO0Wudvym4arS7jvOcS6OLAk77qgDltEerEIEgGErwPOa6Q4iMx7Rlz258eI
 fulIXk82K++uNIIaFat9XX+sgOEfQdwXe1pqog5wQw6RsfNN2FxBAY8uZbJoGgZ4ZOSASTVxr6q
 gMtOC99bGKJw02q39eWNf3ESa2KldfxXycQ1m6BAv3nhj6Q0OMD4Ni4kpWX35rx5+S9JVWoNfqH
 P9cZ4lz23L6H0FauHMx0ytSWr0M2yjp8RWUDuXzqzltcpvUVBm6IHn9+EER4oeHOYn7dPVKgl3v
 xPOT6uVsIdLCGqK3d3Du5U25tUe6aJGSIgW6IQ9g1udMR8GKlJohMJUyTGhmxPohHWpQlBcsDpG
 424aK0KfHT0RRxfuxT2ldH/G4VErYRqmHZ6pSoTSCnoTo1QNDfoy6l4uC+4jqUjJzVKX2f5xCo1
 AsyG1kWMmwv4zmCQCnVIh1Va8p6G0KpJDdYSCfRzVLXu77Bj12BVISP+OxXr+NGJTI14G3e8nYC
 FIHYbq7glAX2LoPaoe1HrRZLURitlsYRmYZIr+rH1Ycx1Abfoc9lw6Dpzd8n17nBuEeJslg2sVH
 nKIXmR6ElsRnJ0Uy6MoWkhlP32kNlseHr11Vfoi7aRsxEko6PAtD4UrY/QcrpElBVwomm+BMv3F
 biCuEpDVgSvzbKA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: qUzb7V2cEXD7RDOvR0zXbzki905C6bbr
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957bf1e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=r8ysD5ROA9t2CGWeXHcA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: qUzb7V2cEXD7RDOvR0zXbzki905C6bbr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExNCBTYWx0ZWRfXw5YF7HZonYhp
 0Z8fTuRH+tXUDvi/tFwUcLbOAsIPSlM0f/tNd4gW39ZmU+3e4Y9vjojZ3+aHtyhQSLRTpOVo2j/
 03NWC0IVuBi0q1Ei5AivnIGrLKd7EucPP0EAtA3ZiCZZ16GTXU+8yUFhTQr49dZo7HtCJGIk4n8
 LYtTBrzqq+jpfw+hfO2Iq5emN3wRQasfhFcygck0YnCX8ZybE4GHoEezP91Xw/1heaJkvsodZKH
 W3CgKHSUqO0y66RKzOzhCR3eTI68sCGub9YLnto6jKmozMIDCKbcwOWaa7gjUSI0VVaGMeYFK7L
 gpRY6lJyKpDH1Mt+QyqANi6DM/hcP3no1AQOzPIbPnknh3iI8ErTuzpGPCYztsaHoIYHqYcoAgh
 wBFIQa/EpQJtktg8Pcmy/qPtYZ2ahlb88pFv1eX4PVst3CKW5rwf0dOTwed3gA4qGVxDP8jBCH0
 Pd17p2GjHd4dHy+lYkw==
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
Subject: [Linux-stm32] [PATCH 2/2] bus: stm32_firewall: Simplify with scoped
	for each OF child loop
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
