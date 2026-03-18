Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDZKFMeHumnSXgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 12:08:55 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D7D2BA873
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 12:08:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8EC8C8F262;
	Wed, 18 Mar 2026 11:08:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56C02C87ED8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 11:08:53 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62I9bQrk3281171
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 18 Mar 2026 11:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wR9AMTR8ItIvFVs0Nnm3qG3RmglLx6erxP1oN+Z3AhM=; b=Wad3rk0SnmL5ZVJn
 dpXTzwHKSYsJaZLn3qZjfjHbPGxp694yAGTcCdvtSOO3L3GvIxMOOEEFEz+G1r7h
 Lelc8SqdvjSsNqWQBIslSm9dY/d+ZhblAbdtP44uPuN7ACVQ7mRF0NinkjzTCvvd
 ygz1PFa8oORAEIhJfVcrwrLJvovkW5wgzJ3m6wLJ/ssLAQ/Ylt0Q86Q3FdKC7U72
 IBv3kguccWtr20mp4lpRXB9SWydDYq3xQpWoRfujahACYWxi7ft57l4Uaf5OtMhi
 kXDvjRMMmmXxIAmNbTp6aZN1yA55ymWev2q1JhM+oZ4DiCgk2N4eqRfVkpQAEVHu
 pxVyMA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya62v5ae-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 11:08:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5092efe29dcso48909701cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 04:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773832131; x=1774436931;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wR9AMTR8ItIvFVs0Nnm3qG3RmglLx6erxP1oN+Z3AhM=;
 b=NVavXHuBKFKutG1H/22gwuWB+uJJYoCvXFjLtMK0fF7Z7MdqtEUml/oUJpOZMsv0xB
 kjTbTxWrxvaNLWyNHnl1Oj/x61dwUOlr2xX5CUrdKfhpOAvzl47/f8aX7KW0dQFFcZM1
 z8ltMbm6spAQ/qIrQxxLp/BSPFRcGbY+f9z0zeHGlzS0OStK0/h4ICdGiBBTWpVox02F
 pndx9vsyczfyZWpDqHiMouyqIUBIBK5H30fd/dzGxn+5zKtnibBANEjMXTWE2X//C2zS
 GwH50ohUtpTNkfyWFLW7TleFy2I3PDk/maAmLD9zWxUV7Rq6P9MH7GVy8NmG6epmjSdL
 51tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773832131; x=1774436931;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wR9AMTR8ItIvFVs0Nnm3qG3RmglLx6erxP1oN+Z3AhM=;
 b=VFB7YeWjGDmFhygPNStNF6t+ydu0pQni2rrgBFn7F1xnOyaQjc6Qb1dV7DUn1hpLUh
 ZLRpA5eGWrio6nLRddDSVsTVzFDKiMsQVvfOOSaY2Oy9mhaKGfFvILyVuM985j2FwDzr
 BF2WMaxVrCjawc/lZLuPRstRuk/MvkEDOnRsJRx2uTQ6c5m/iQ590120xv/daV2Rihjc
 vjvYGG05JkytamLr0b3KYO3YqXygogtzu9GyhjI4scxp44lal4YUhfcB0A6eqetJS4qD
 rpJM0B2KYoaMmuwe85/RXp5NAc1EowsiF7rHckE5DmDGLL4KOeR/qI80nf9eP0yE6VSw
 iq+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeWx2YETuJ9oCmYITYevliIcR/u6T/fzqtlfgubUirWGClbXK5aGKzuR7ozdt9jiR+mh+miAdOHbSJOQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzQQAPv65o0cOaMGps2WE1X7LmUgCHzfzGQO0JQswG0w7rdZDBR
 5WXN6S3SkqEbDldnOdrRYkjyIb77N40jsE+SqNH3aED8qAInGtjsMhT7hOsfc5x4tOGfemU8SO9
 0cHucELG3xvIQxJ6/H/Zj8/nEsGs/y+BfwCWYkXT9tIS9P9ShJmhStWIcAzDnLZNegSXfyJV8I9
 /EAPnmMWs=
X-Gm-Gg: ATEYQzx/s60wJ4kkaor75MHb1uD+fC4bDB/+6krj7VwvPak/lxxSUIOObQLacLYv8Qv
 O+tSj+WyIqeDJ/2n3uy6bromkHavh+is4bkGuEbEgYya+YtDbPnBj/7UAkSirW/fCvramX65NgX
 aWtWKvi1TFgDcLcT8bpioPx3WbC+0wL5HVUtKss9QlyMq9h+VBa9TIqN5VR1RDuP0nEX8Rc1gkO
 fTNGssoZJ4nedI/jQlYKUENYGM+xSs1rJk0GmH2Q2X3iq/pjTvYho+5qMHH0buhYeiz0y3HwIZ+
 Os8QhQtZ7KdFkNM6EkgYttKRsVktmWqwABOThEarKqEt1Zvgxvxr3WKgG7h0glL/FucFAZtBLkB
 YunlHrdoQYiXpZOtTjgP65ObS7iS/82XEMAr8pGYPPdnS
X-Received: by 2002:a05:622a:18a0:b0:4ec:f2e1:483 with SMTP id
 d75a77b69052e-50b14869854mr32484691cf.26.1773832131436; 
 Wed, 18 Mar 2026 04:08:51 -0700 (PDT)
X-Received: by 2002:a05:622a:18a0:b0:4ec:f2e1:483 with SMTP id
 d75a77b69052e-50b14869854mr32484201cf.26.1773832130763; 
 Wed, 18 Mar 2026 04:08:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 04:08:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:40 +0100
MIME-Version: 1.0
Message-Id: <20260318-clk-qcom-headers-v1-1-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3783;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7hyg1XXvT5j3mOuyK22QBL9DKoIwlwiMnknBQSnTpeA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe6gR9bvfg1adntW7DiNK52kg38RdUAFpdOQ
 IXra6l1f4aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHugAKCRDBN2bmhouD
 1/6uD/9ZAAGcvO3kTn/UshqbTfg0k/YLc5NItNNgKuTLe+1MFzJrxMI29Vl/+25cC1UD9daLQsG
 bt+zzp6Ue02o+vJ13Bh8etpYPLBWuF3MTXGOl9D9LdYI7kW/3sLuVJ0IZg5WulI9GKBfDKtXmNz
 AAWcfeLObmuasvBK+u0bA1iWGa3e2U6py9KryG3qFGIpjpIo1HpjzkYwUk4LZ8Z5RwN7q1UcBh4
 B/xGEWUahLpFQVqWCPXTchouENIMc2uYixnyvN9++yNr7lPSBlFrIgsGVvncXT7roblpUify15I
 R1vnHJum7RG4vqgKy0KsZlpx6KVaUPcVxpL/tL8C91sMnUaMzKKn0KLgvzaPeZ80Xfp5VgTN5Hz
 7OhsDRu4iYy4GahSTuWbPPSZ12TLrgXhbn+wmpQlBRt8SdrM7+7sFu5g53BZjJyv2FfbjnwG1pj
 7MpmZtu/ly1UrNpY3JTwX7v+OoykNJ0CYYpJ48ca4fYIpQYOR2L78w2nw/sjgxX7iG2Xu7QlqFc
 bWIbLpYabbwxV9Tb6eUkQrMNjt8s61TJ1ikMAGHxiA9bic7F4vqi9D45sawgcO3wEn2RXv2ZXyw
 BjdhkjPzxmoBudkh1PokAEqY2tgGgxKXV15W1EWgacDaTBwR5Dp7yY6YIpvK0yCI192m2WRoZ0K
 pmph9cv0QhJg2lw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Ns3cssdJ c=1 sm=1 tr=0 ts=69ba87c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=BlA2PGTryg89HV8owXYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: s0gFBgGzbVZf2jN_GSHaW54vZpOTXZVj
X-Proofpoint-GUID: s0gFBgGzbVZf2jN_GSHaW54vZpOTXZVj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX4pj7681WUVjF
 OMiqw7srl8fOFF8zLkvjiTrXYGhLcQOJOy/+9vSohTVuqk2h4AbboCbNVMstEpl2eeiFSZAF06V
 xvKjSdecty+hnK86j32veu77gawVKMqoJJYcpY2QlUbU+5ESXRAyNhS+ygSi+Yb04mkUYyIfsg6
 6fkcjfiSOm+xrGn19pWStypx507fRQf8AEl/h1NJQKLASnzgQ5SzJXBY7ReP72XDs+HC9lcQAk3
 Alfv79WoSnUqDKjXrUGp6Xn2jXApRTK6gKRRaWC8mhEbWgBMNfR0Fp4Ew5qbgcvyOtSGF5lWCFB
 SOXA0jg7HTyg/UEEmXAhJYWExIFBDQTWKhg9mPladyndJttAoAzfglvfRdZH57ftTp/EsbSHghh
 Yfm+Qo2zTk6W2spJ+L920Va2Qe91R/qeGwHxCLKgbMRXf/zhU+H+3ConwD1L+gFn2NhVIwFY6mk
 iuxIigJezaGqWCgVrTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/5] clk: qcom: kaanapali: Cleanup redundant
 header includes
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.661];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 36D7D2BA873
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove unused header includes - drivers do not use any OF or runtime PM
API.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/cambistmclkcc-kaanapali.c | 2 --
 drivers/clk/qcom/camcc-kaanapali.c         | 2 --
 drivers/clk/qcom/dispcc-kaanapali.c        | 2 --
 drivers/clk/qcom/gcc-kaanapali.c           | 1 -
 drivers/clk/qcom/gpucc-kaanapali.c         | 1 -
 drivers/clk/qcom/gxclkctl-kaanapali.c      | 1 -
 drivers/clk/qcom/tcsrcc-kaanapali.c        | 1 -
 7 files changed, 10 deletions(-)

diff --git a/drivers/clk/qcom/cambistmclkcc-kaanapali.c b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
index 066c1087b0b6..6ad912403b8b 100644
--- a/drivers/clk/qcom/cambistmclkcc-kaanapali.c
+++ b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
diff --git a/drivers/clk/qcom/camcc-kaanapali.c b/drivers/clk/qcom/camcc-kaanapali.c
index 82967993fcff..c848ca99e9df 100644
--- a/drivers/clk/qcom/camcc-kaanapali.c
+++ b/drivers/clk/qcom/camcc-kaanapali.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
index c1578cd07041..5ec4d2ab6b67 100644
--- a/drivers/clk/qcom/dispcc-kaanapali.c
+++ b/drivers/clk/qcom/dispcc-kaanapali.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index b9743284927d..210ec7afbb67 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/gpucc-kaanapali.c b/drivers/clk/qcom/gpucc-kaanapali.c
index 52be48c15c67..d93d06067fbf 100644
--- a/drivers/clk/qcom/gpucc-kaanapali.c
+++ b/drivers/clk/qcom/gpucc-kaanapali.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 3ee512f34967..795ce40e028b 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/tcsrcc-kaanapali.c b/drivers/clk/qcom/tcsrcc-kaanapali.c
index 4da77367c9e0..db46d639edb8 100644
--- a/drivers/clk/qcom/tcsrcc-kaanapali.c
+++ b/drivers/clk/qcom/tcsrcc-kaanapali.c
@@ -5,7 +5,6 @@
 
 #include <linux/clk-provider.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
