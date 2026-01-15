Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBE4D289B4
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jan 2026 22:05:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29A44C8F28C;
	Thu, 15 Jan 2026 21:05:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32E31C8F28B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 21:05:52 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYUBx1723094
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 15 Jan 2026 21:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=; b=LcyP4ZgHar0lfCNc
 erfRehhLm+Jly3LD5YZe+gnbNWLMPpKpCHqXWqbxOusksc+bO9tXicyW7jh//NJi
 usIGfOEjO9AEv9gpfGj/98YCcHfrTukl/zYmQLydJsdQKttHrSPAJdyOP2ZwhZgo
 JBQMEwdzMGLiVdBk1W/SXyZVvNdc5NRZT+FM7qpEx7/7NvdPOy5frXysA8s0gU8J
 ZqNYay2ewVXzcLHlbBz3ecFwu6edWv5ajyjydAsDG19/Yj+LuCA7AN0opCmt5loq
 k4QJeBZL720AEGIBMtghVzSNUa8Qz2OgpGPhh0XGju56X61amGvdnRG64wNypL3C
 6E2Taw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna2fky-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 21:05:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c52f07fbd0so603667385a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 13:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511151; x=1769115951;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
 b=Iz4Zjin8RMSpCVnxhLgiPdqrNvPAge5d2G8lNIovN6E5FYA+RJ7yfBPZ6SmXJtK4QB
 ckM1TBOwc8XGplFfslJJ01BKzcxZVGiVTTKhjkA2cmJCO30llvhX6YV8lYK+ZlsRPzwQ
 VJ5c91ov+viIYryqvyyIwTA9CMktRFnChSWKuJdvw4p1XphIHNrjOxOvIEvRfrty++bE
 HA+5mlwA9AZCxSYE12K/LKjbr4gOX0Qyhk3nWkIQ1Ik7S2IpE0LuCTYMTdc/S0enaNeQ
 jJbjTL3U0MMCMHoYYsOltKGcLWzYuw2BKho0a57r/gNk7huLcQRxqgeqoYJJX3b0zfpI
 LEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511151; x=1769115951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
 b=U36KGKRa90fnjExtePOdsNxeMF7fPx+QL8mJyUGvwl/ABRnjxl3C/Z4E+vdbtlXHRd
 QtYsZEj80JXQxZyZzWh9hc2Yjou7Kjo1FCjoU8Hs0bZXvV2TyX2FPPz8Tl8ZyYoT0woI
 oZMRvJLK2R9hTJt6mqzzJ6gjT9IViCdRh4Lv8Q3oDp+yrDO/OBGFXxjI6h8LuIVw+Z2i
 q01mpzaDFBT6gMuWDLAEeDgPMLRomurrhxHfygDnpn8cL1G2bwrFQn2xIsClRpqja2Ab
 +g8hy+zyc5Bij6bJTtO7dVTz2J8CjjkviqtpWdnDQaOs+FqSBGmBfnhZs30KDFSrzViI
 iLjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf4UHHj6i39rXz1x+kYQOmeHv8PJMTgBYUTzUCP2lT0uztlD+aW4W1Yb/K279p8JIE3Bq8/7Lsg9k+hQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzAzQpBSLp16GP7t3QuPxeEchYk0c2TXxbbp5064VaIrVAaHQR0
 G3QmnALfdE27Pv1s8HkLmtp7L9OxrQkRnMMccEbR+CzYVO3c9Wgz4VWP/gypAgBI9o/TTw4jDEw
 XjovjwLez8/F6jnkBHh8o5RMW2gKwwed7V0ZuHzpv6+BH/CQaqmuV9xiqmpEvtvEUxLZZk/4gDC
 v1KjQD1M8=
X-Gm-Gg: AY/fxX5cZztJEK/oGQkQ5ep6sJZcemxHrsUiDGjg4MZywdANWXKvOIbz3hmftHVAj3J
 0T5z81bA4KncCh2FedlcD8hr+5MIJ/nXnyCzYsnlDpkZLwFk3azlECvqhgIpiD8uggY8qmlv+cq
 0dIBgb2sQYSIV5URXlkRffWF945MntWvzwmWlMIrFRQZ/RyH/JzjJO0x0uN3g8n+6A/StUY5Pes
 FlozKdGf+WTzKhOghB9XbBXBYPSOTCz+lRf8XIWaPVsuwz9s0gBNbbVmojSKwCf32V6ysqRqXaD
 xHUqKhCsjWz9hI+NhUbsHdfAYWKykO0iyDLik4sQ8j4Y9DOn3B8Lkuug5RAaYhIzTOnub8XAA5q
 AkLB1kifGeklMJj2EhUC2U2qKUJ4h9381DP8pVI0A8SUYZe4UDf6klxf7PHQoEcRS8vDMxci6ib
 jpRx4XhgE6QOOW592ZQtbknUg=
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id
 af79cd13be357-8c6a68d2f67mr120080585a.8.1768511150925; 
 Thu, 15 Jan 2026 13:05:50 -0800 (PST)
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id
 af79cd13be357-8c6a68d2f67mr120072385a.8.1768511150340; 
 Thu, 15 Jan 2026 13:05:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Date: Thu, 15 Jan 2026 23:05:48 +0200
Message-ID: <176851027322.3933285.17869583744437773979.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
X-Proofpoint-GUID: kOr6ktZbQSptILCyp8yGyJWX16yAOX04
X-Proofpoint-ORIG-GUID: kOr6ktZbQSptILCyp8yGyJWX16yAOX04
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX/uiMXQgK1N90
 qLfnqxf7Fkzkj2Z2DOCdHBd8l2qgyyf0HRXOWNtLJgcDmN96OZmt6RU1EnVNNu6NfjZ8hdFoa5H
 zwwlmo+wJX5yPzjoUy2VALBz2G67T8Bk1ibKNg3+Uq+5FgowUfIN7xPSZUakJ0jHXs17eCUMw5m
 DKz22JtvIEgPjYXgwY774npCB/3QdZKKPn/jAtQUhJFujySc9jY57mtHsoik+TmO0Rjt7ONgm/t
 LTtrwt2HYHA6ffLaxdKMqtMGyKv8fCUigmZtmLsAp3UGPGNOOt96NuDsEq05CCeyHcqgqc5fkxU
 PkeimbmbH+36mOXGx6E+RblSqiemFXyxnVK7hSxMujzkgbpFmGYCAXppuBg6AXOHjP2TJQw2NY6
 ditS04LQ+Gy1dOK0eyADwnpDlTgtjRac9qTiH1XGx6rdO/sWk4LxBEnsTmLN/MGeQsDmTZXGYi3
 H/KP2OxDgmcBRfrC3+Q==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=696956af cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=whp_R4xS9ENlu3RGya8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Shan-Chun Hung <schung@nuvoton.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chen Wang <unicorn_wang@outlook.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Orson Zhai <orsonzhai@gmail.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, linux-sunxi@lists.linux.dev,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Simona Vetter <simona@ffwll.ch>, Jacky Huang <ychuang3@nuvoton.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, sophgo@lists.linux.dev,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Chen-Yu Tsai <wens@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Inochi Amaoto <inochiama@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-mips@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Takao Orito <orito.takao@socionext.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 00/27] clk: remove deprecated API
	divider_round_rate() and friends
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

On Thu, 08 Jan 2026 16:16:18 -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.
> 
> Note that when I converted some of these drivers from round_rate to
> determine_rate, this was mistakenly converted to the following in some
> cases:
> 
> [...]

Applied to msm-next, thanks!

[24/27] drm/msm/dsi_phy_14nm: convert from divider_round_rate() to divider_determine_rate()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1d232f793d4d

Best regards,
-- 
With best wishes
Dmitry


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
