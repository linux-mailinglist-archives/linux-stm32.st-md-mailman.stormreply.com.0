Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 641F5B56D36
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Sep 2025 02:14:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE6C0C3F956;
	Mon, 15 Sep 2025 00:14:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A81CC3F93B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Sep 2025 00:14:16 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EL0Ltd028132
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 15 Sep 2025 00:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wfIfmtGDU0fMWPSXfBq3QGPr
 RejWAR38abE4jrrVyJ4=; b=SUOFF4XNRO46ay3UYMsN/RFX10KQxXKyoxTnQuXZ
 jFJzdaDG7YKTMEn9DWCJWxVSXROJy/EXK3NdO04I9mcIXSc+Yh/oybm+zoM+ge5X
 gi4fhfdHiD1oKn3jHPCZVjcbVhwM3M+b5O/K2xeAn5ptq4erGu7d/KduI3Oth0WJ
 +B805Q8T8Djcm8Rj4Ww2v9PMeN3VK6fe56aORWjK90imQIePdZ9NFJr4nuelu3MG
 rhecpEnLlhZspV/JJp+w/R9551cQIuSaCTbO+YqVOXuJrhx273m369UH0Fdvprq4
 MlL1BYxYnMQndpZgj3CiU5DnpjQx81xZnY8MOt7Q2TsqqQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072jxc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Sep 2025 00:14:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-77d39d8f55aso12682466d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Sep 2025 17:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757895255; x=1758500055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wfIfmtGDU0fMWPSXfBq3QGPrRejWAR38abE4jrrVyJ4=;
 b=WrcBqKRpxqkZKiCaIYHFCCqmWMFsXealZnJGHS7NolwkRIFqpU0MV1etpHOdAW2nJ2
 qreVAHoE5rC3U1Nw/7kxFN0sNbpqzpTqrArBI1fHFMxpi3mE2S9mWzd23sVWMpVdalEL
 vEcQBL+I30rX8TNajIKG+X2ARs9xOSWlQhJZyn2YcC+jlzIAYYhxBHprXZTZpQ01+uu1
 DkosjwiX364382hRSZ8uighCCIzYO+H/MkvcNcSjZrztU+Sc4XhuEO6LUyg7mBuaSwu+
 z0ghC8JBkBUxO0DHizRAQq5tUeweZaANMdSjtZqZXci5xtCtkoeg0SoZs4oZFWM3bJSa
 Gxhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH38Yi0qNnlosL13/bxNJDf6VSxDbRkMjQxLGxtTDKo7u1e3sNrC0XnbornMMTN0Xawe0jUeOw5LC4bw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz9aaVZ5e2gWhYUy6Ta6gV19oOR7/0QpO4Vavh6oETIBI8wske9
 2r5GiGGyy+EjO+85k4Ua2Ams93Bz/07uEW8I/XZdJoCiQKwl4Tpw/hXNNA5CqJmyvvQX5a9p18Y
 9+l1U7ocD/smhQg19Vw9FSQEsx43HEB8YoMIifRci3XJXrAli32wD79i0Oa5AGEruSVWx+hZzUG
 0Oz63sako=
X-Gm-Gg: ASbGnctsZs/TZL2Piyg0Ci6P/z6ljQO+vHoGar+tgaOzt6y5IML10jZDiq85qx3q3IL
 cGOJo4goP8CnfIrDqpyU2bLqqU3IsBxtlRWWZOitjY0qahyuVxHIhWju8MS7MlJo3rcTzbj3zPT
 3SJKkOWf+0teKKuzDHbVmUT0fw/a98Eq2Fa8hp5TXnoiFS7VnTXJmyk51ygqhtj33WsCe0zvyoG
 y5e3IhAoYoiD/5shf0Bse/1DXCx5cpVWMLMbwWBw+Aty0anjGcPVyxQf3LjDYsaLZ8IcWhv/RVA
 lDXAbwjYO2WdklP4c2ZQULSEc+yHZgThSXZDSC3PmQ4plulBjtBYTPnyQcZ5/tsOgT8/ngpcVp9
 Kj344xuwUdc5/ixZr+0roZQ6LcX7atG5GiTB/9qnlzVkSrJ4JVXgn
X-Received: by 2002:a05:6214:268e:b0:70d:cabf:470d with SMTP id
 6a1803df08f44-762262daa1cmr182241896d6.27.1757895254722; 
 Sun, 14 Sep 2025 17:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHObBFwIlp3GQ+VOBYwejw1PxkvVAwhDilkZbOEooVdFxkX7Rq1AOhro4RGokvljow6YU9iPw==
X-Received: by 2002:a05:6214:268e:b0:70d:cabf:470d with SMTP id
 6a1803df08f44-762262daa1cmr182241606d6.27.1757895254257; 
 Sun, 14 Sep 2025 17:14:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c692daesm3255202e87.26.2025.09.14.17.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 17:14:13 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:14:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Message-ID: <pdodeksqchby7gtr7oukm7wqleu535kzh2g3uaseqmkxv5g7qx@jvh5fcppvutm>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
 <aMawQYUIjPw9m4IO@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aMawQYUIjPw9m4IO@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX6vVWhhufUACJ
 y5pjPauqU0xe8/A4wiWkQnIpABucEMfJZ/HgDZrViHcg12C3QVA1jf73Y9DVIHBEX+kTrkAum+A
 vXk4z/6fvMG2eiQaDsBCaAQMMU1MbIvfMvz+Bwiz22a1+vpVW+k2ityqZlIIUORIjiXVA1CYDdb
 l4HAlSWdRCkEcqh5THj4drBYNF5KFyX7MzgLy05tD/Awf8haTPQxpzm5emG8H7K0JfWOr7E7ay2
 CIyNE5GvHFc4FP6fIsjXuePq8kcPASjIdpzUb9foty+o/jbGXqiG6JNL3mnjIUo2se2ITu2zfYI
 gtiz6XI79Yaz/yWIM0m2nA6AfyBpc93se3Y5p06GhOgseGHjY0DOw5X56dTG6Vhs/gNUJpXmD7W
 ITbEVD+J
X-Proofpoint-GUID: SvZyf83rMHu1kjM8kofuagQCd36sReAu
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c75a57 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=ErCwDgQeR7lfzThPobAA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: SvZyf83rMHu1kjM8kofuagQCd36sReAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025
Cc: imx@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, freedreno@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/9] drm: convert from clk round_rate()
 to determine_rate()
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

On Sun, Sep 14, 2025 at 08:08:33AM -0400, Brian Masney wrote:
> Hi all,
> 
> On Mon, Aug 11, 2025 at 06:56:04AM -0400, Brian Masney wrote:
> > The round_rate() clk ops is deprecated in the clk framework in favor
> > of the determine_rate() clk ops, so let's go ahead and convert the
> > drivers in the drm subsystem using the Coccinelle semantic patch
> > posted below. I did a few minor cosmetic cleanups of the code in a
> > few cases.
> > 
> > Changes since v1:
> > - Drop space after the cast (Maxime)
> > - Added various Acked-by and Reviewed-by tags
> 
> Would it be possible to get this picked up for v6.18? I'd like to remove
> this API from drivers/clk in v6.19.
> 
> I'm not sure which tree(s) this should go through. All of the patches
> except patch 1 have at least one Acked-by or Reviewed-by.

Patches 3, 4 were merged through the msm tree.

> 
> Thanks,
> 
> Brian
> 

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
