Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AKqIcWHumnSXgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 12:08:53 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 237C82BA864
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 12:08:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5528C87ED2;
	Wed, 18 Mar 2026 11:08:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56FEFC87ECE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 11:08:51 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62I9Mv4b3358513
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 18 Mar 2026 11:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=6P/1d0NQU/iMLV/r5y251q
 GYem5RUiR9rUnsuv9NHS8=; b=jYwM3HrX30PQvx3eQZxJEY+9njS+FT/cwicGC0
 BOf4qe76PrjSFKqsRqDG4wmY8IBu/xSHgfDIiZVsmiL/o4bcYSPgTIJBV45hqSZn
 0g2MDf35l61QUSEBmwIlvWjRwvl1K7+83Bz9O3Udgf3SyFA5Q693HbeeCpy0ncwZ
 TaeQnhh75h8/NORxRhaXwSKtjx8MkdfADLYggBcqx4nSsvRPpGrIa+uDOLn7HNBg
 OUFpEtMuNdQ6Q4l6UaiucnrSypL1GWEsQCIpjENk0H0OS8EwcNw6tdb7AIm+xZGw
 ibkZwbBR2l7opseSy0Za0923MyXZ5QmT8nzSP3nRQgtES6xg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb0cqr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 11:08:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-509177a915aso65567161cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 04:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773832129; x=1774436929;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6P/1d0NQU/iMLV/r5y251qGYem5RUiR9rUnsuv9NHS8=;
 b=V88AHYAuG4n9sOkxrwgCBGUHAF3i2/Ie3zkNYWX8BG7NwibIrKVrPdI4VtSv7dxj3H
 /b9v5knV8KYtMkm15Sy5Gt1dZ3bw95LxS1unRkC94TiXqOpX2bit2GDKNjE7EtMrd855
 KndacmCVOcPg6TJ7RGz9J38PHr2RfkBK6D8jJs/fTEyol8m4fvZN3WxgFX6Eksiavopc
 +1out+HRKEaTR+oQexjpvyurExy+diE5J1s9nia7Kpl2eMUTyUGegBWSjYCxihmWE42y
 9M3BvxkPOseQ+9DnGAJVO+WjxTYl7Qe3LhTo6Tpj2ecna1E2WE8HyRsOVu1orYzBGzXr
 ytZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773832129; x=1774436929;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6P/1d0NQU/iMLV/r5y251qGYem5RUiR9rUnsuv9NHS8=;
 b=G94eS8Q4NxIFiaaB37mJSsJlDDV5ITnpgT9Tq5wv+4viRXvUC8yXofedp/QHDY8GJ+
 QJRciSGk6LHO95d0EicbHx5pSjs8PgyW/25Emkv4MY2xpKF67PqqSdiNv7tLa7UCp7w8
 plZGILU7Oxu5ibfO3oi8BwGM/cH9+sfXXg/+EbNHkeEwmrS9eB1gffRrLErewHYY6RGy
 LS3mnesHMZyIFeNesPgUk7R7I7FVdj6izu9Ga1ZEzgVy955+vbkG7nfZAureMAXKAO2e
 suDAkt2Kmk3u0rwwreRyAJH+/LlVHUCGfjV3mB/Lbabox9P1gYKHfVhuc47RpAGh6yVn
 uXTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSkC9aFOeDLEFjA2EegM6iFuR2DC2mhCwnhdmxleVA85ZBnbvdha7Bj/qr7tG0A0Gb/PkLRke1WlHBug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxf1I25Yb3F5CfvW/m66AS2pIWCwiQ0zVI5wwWyUMWwGreEO2vl
 ICo2lsBeMFhw79FDx8B26pLOfMnzhcyms7BNeaiMb81tTMahpw6w8gYoFPnvcKlOicIpc5mQXCB
 LX3UJ0JkY3yuKCrehw7dtgMmB18uIf/xXrpcg1mlCFsVd6yE38QGplZdGJlw8q97wO9JTs2Us8a
 AKOwc0ezo=
X-Gm-Gg: ATEYQzzPTen1ZYthMmG2jkfudI2o2VdkfJOx6w4rQvENtymGL4BhuG/g/FOgOsALvgJ
 s5/0OvCgBWrfKD9gUvW4nWaCvOx4B0w690sflQXDrCVTDOQkPh1ITBoyZxPqo05QFQC5zDOBK33
 1lS0GWCQpe1BjX3LHn5qE95Z+nIeYKwmkcPG+eiQRo0ivMico0rnQtcUKqoYd6fGxqS+vDNtmQl
 cnBW6TrfsEz2Z8OUzSE66NlwJ40Vzg3nmeSQD3diH+ABkffo/lE6hErX2b2709pPIKqTEOIFaep
 0XfIIEb9BwubaCaioQz0ZqyhwL8sGwW+yiXS3IdmHEiQCfOVQmKcY4ovvfigSB1sqa3nrdI03+f
 neXcn3sTari7tW6CR7XHmAO4U92VAhlPpGBnYRq8gsWZU
X-Received: by 2002:ac8:5f53:0:b0:509:f1e:41fb with SMTP id
 d75a77b69052e-50997ff8b59mr81729701cf.6.1773832129280; 
 Wed, 18 Mar 2026 04:08:49 -0700 (PDT)
X-Received: by 2002:ac8:5f53:0:b0:509:f1e:41fb with SMTP id
 d75a77b69052e-50997ff8b59mr81729281cf.6.1773832128819; 
 Wed, 18 Mar 2026 04:08:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 04:08:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:39 +0100
Message-Id: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALeHumkC/x3MQQ5AMBBA0avIrE3SIqKuIhY1hk5QtIlIxN01l
 m/x/wORg3CENnsg8CVRdp+g8wzIWT8zypgMhSpqVeoGaV3wpH1Dx3bkENEMhoapUVZVBCk7Ak9
 y/8uuf98Pq2OlvmIAAAA=
X-Change-ID: 20260318-clk-qcom-headers-9b9cbf80a04c
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HkHhXrqMmiFyx1YPTM2JfklSww0Bi7KnBOXHoYhSgn0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe5DRsIdJAD/a7UGCOmOb3WtrtU4Up/ECtQ9
 HHRFzsf78CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHuQAKCRDBN2bmhouD
 10CVD/0ePbX1fQO5ftCAlqT4j2WM2c/QyOSzZQ6rOdkDqIr3YnOMWppyeNO8KoC1+hj1H2oz4bK
 +n5L7KB7Me34rSyS6+wVVfIB3UxzvrEMZlv15U19gwfPPv1sKxdAFwyw0jmkUYF6jY4n5iE0VOy
 a4qui+C6SXZP2UWNzGLQ2/Pw++juCkmoUGxZrvgUFiFMubYwZF6SOkxA8D4h+ZhfUsNJvlkP5oK
 r61pXpWlHueSQZMdwmO3x5XHMcjjAg00rA5e3EWqrn9kyBltdz/iPamX1bTu8bbiUP4CgvN8Gf+
 LVzc3nRyEwcD1DnuGZLXYmu6vMAGA4Ac6RzNUcpOBFCbSLTGu3VQlnXbWQaKQ5votfdHGzuFIeJ
 VhN50mE+OgTehfni+ieDaG9pIM5rOFNb4ZeMfbzk2fmt1LPQ9XTSIfNd6Z/bcD2pkY0P6wDYfC9
 8K/ypcopbFBqW9f5RljwFj2RsG3FGUhf6A1nYB7170ty5hvuso77Obdkn4u5ozgjwMxAjj5SU/M
 mXs2USw/TWbSkbadLNezp2gpDjubtcNaJoplBkwPbIwcfbY/IPkXqfcH1nQ4NxAWlnw+TG/HqQd
 v8tnZSrt0hdhVQQMzrFS68JMb1nV2g/0MlpQ07ipa9OemuFEZ89fMiQ59M6XM5qL7oqOgPC8pHC
 dGpWiyM8OssiQ1g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: AEg5OyyXP5tgCLpvqYa_zNSDCzm9hwhj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfXzWU1L3rmOoWs
 ZeT7SqL2o34Zne7c1y1AdfpHJZL6F37ZgaqT+HQ6Z62XTy+OWCxpv49CbSepTG0YYtO/0rvPSyl
 tcaVch2NlpwEyBgXjxDKwKcTmk+jH/vfNHwCh+R0X5P+WzRZCyK/mhl5gLBnRlIqZBHfG8TQnvd
 awX91eZ1Do7QPED2Ws2Ou/ijyss9bIm7EdR45A6kRwH7QHurG5RpOXThU+0ljR96quJoVRvCD0Z
 lL/lkNgimkMjs4+XeavW4ulYbc2eiaqjpfkDs0rA6S8kAOLngUAHhRsfJa8HB/UeanM8W7r685V
 5pHBAPyDyvrEsuQeJfT49/+GGEA4xA70Frlysg2tdm4xGsyvKXRTyshuvB0VOOrfkoUDPpdPhXC
 JVoJASB0YuYnCcXDtO6u91XxHNnIEGnzp8Mz0IXc8p0HOZat1Ij+hZAAtfga8lKjnl6d3bbz4zS
 5GQYEmS8jqy4e/GNM8w==
X-Proofpoint-GUID: AEg5OyyXP5tgCLpvqYa_zNSDCzm9hwhj
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69ba87c1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=T-bvjWfsjI7GNFiSrugA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/5] clk: qcom: Cleanup redundant header
	includes
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.705];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 237C82BA864
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Newly introduced drivers keep repeating same patterns from clock
generation scripts...

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      clk: qcom: kaanapali: Cleanup redundant header includes
      clk: qcom: glymur: Cleanup redundant header includes
      clk: qcom: sm8750: Cleanup redundant header includes
      clk: qcom: milos: Cleanup redundant header includes
      clk: qcom: eliza: Cleanup redundant header includes

 drivers/clk/qcom/cambistmclkcc-kaanapali.c | 2 --
 drivers/clk/qcom/camcc-kaanapali.c         | 2 --
 drivers/clk/qcom/dispcc-glymur.c           | 2 --
 drivers/clk/qcom/dispcc-kaanapali.c        | 2 --
 drivers/clk/qcom/dispcc-milos.c            | 4 +---
 drivers/clk/qcom/gcc-eliza.c               | 1 -
 drivers/clk/qcom/gcc-glymur.c              | 1 -
 drivers/clk/qcom/gcc-kaanapali.c           | 1 -
 drivers/clk/qcom/gpucc-glymur.c            | 1 -
 drivers/clk/qcom/gpucc-kaanapali.c         | 1 -
 drivers/clk/qcom/gxclkctl-kaanapali.c      | 1 -
 drivers/clk/qcom/tcsrcc-eliza.c            | 1 -
 drivers/clk/qcom/tcsrcc-glymur.c           | 1 -
 drivers/clk/qcom/tcsrcc-kaanapali.c        | 1 -
 drivers/clk/qcom/tcsrcc-sm8750.c           | 2 +-
 drivers/clk/qcom/videocc-glymur.c          | 1 -
 drivers/clk/qcom/videocc-sm8750.c          | 1 -
 17 files changed, 2 insertions(+), 23 deletions(-)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260318-clk-qcom-headers-9b9cbf80a04c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
