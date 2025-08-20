Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA493B2D0CE
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Aug 2025 02:50:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27522C36B29;
	Wed, 20 Aug 2025 00:50:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D7F0C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 00:50:31 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL0sbg019590
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 20 Aug 2025 00:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=fFHU5Uj+jXoPoAM1BiBDUT8I
 hXi09SdGNJ1NomSthLE=; b=M0G0lzwBza41VuZ6YB1X0z5czf2rGCswbu0hfe1R
 nnq1jEIb87cSyTsnH4s8YEg6Td7mYwIGrN+KkXxAMTcmpceRz+IIfX65QJxluT4Z
 HnsR0h5Ebpoi3zg1yiLhdNXfMwOWQIqwuZ2rm8y96Cl1GlXh4zFyvgrxvD0VbXlD
 YMl39iKdWHMpBAHB+lO3dNnLHnoriq8seVJp03cVsT6/2WEcJ/9tsm3sETjzOid+
 F+zAOJr3yzJfB5aV2asOtw6XMANoIs1VbcUlszRDU1kooZOe8YvXnmuYFkZ72naN
 4a/kjdsfYe3eWKd5/zWByF8GT+qEhoPUt7XeVIyEQsWKaQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tggdg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 00:50:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-709e7485b3eso10174916d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 17:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755651029; x=1756255829;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fFHU5Uj+jXoPoAM1BiBDUT8IhXi09SdGNJ1NomSthLE=;
 b=fb16z+k9jUhgH4mpMn9UW4+K4uv4HJBQaWPiCwU6HdcrjANkL/TCtAQpTW7U6tDJ27
 a6lUzfwGRnG690Bo4WaGNC7S+CyYeKU9ddm6UuLsFk+Yox4Ei/1+/zfT9Q5tFzk7JMZQ
 3PRV3iSqERIxyQUUOmt0AdY21x85uy1EGz+1qtlrk8vJ9GDP2BxKQiPaSWEILh293vU5
 jfx8VkOu+yM64YouNuquGrjExTlEzTYPhqwUUlfZo5cEK1LmnThI6DVrFkR0p9V8Krfq
 w89Yf0i3oRbGCfdaiCwyqCpquEFjqCDdoVelDMgEmAV9Aqwzn05lp+Q88+ZOh/hYTN8h
 M2lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXID3MqqKOVJYazEFa3VGhgJ/GjGpm8w9T/pUUjfkZYN6IleSdqwsMAbt9CuMNlyhY8Wv55yB97Rb+VEA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyKFTeR4F66ByMG2s17S8pqqh5BmkM+1RoU3BMuAwpNzq8uHqZT
 m99Wd6rtML1X6y5VLgwytYJAmG8nw4GlIFVTrcRlYppANXHUIdX5N08LPlh00r3cIUBC9O+gyOD
 t2ZsLnblZKRpY1fcnN7sNFYuwRXDRxULTyTl3wyMeBtypIfg7fwGiclpTNlIbmnwxN2QgkKU6zI
 qBr33lnX0=
X-Gm-Gg: ASbGnct9+vRQ4q16H3nAthXqEVdUughr7Y+NIJcrCqmWFA5yCqJiMHncWa/XGmqc60M
 ZEfI3T56vL1TNv2YCq4TJ4jnPqt1NRkreptNFd6eMPQSSqd3MwrF1hlDEzILQg0HH71NvVdlwQq
 qHDjp0/INWGpq5z9Y1Dqs3mo3PKVFyNB7HHR0t9ZEz3O17EtDqgWd5cFs9S09+XSb00rizE4xpb
 bxznfCxqP5spUfy1ZHmpI7sa49BWUjo7frLahse0lRt3s5Nf6Iv+pamqNWAdpCqD3yg0nSyRlEp
 cLXaEsfY1EH+OhCrncvh3E/AT2rptsJsMsgzGykq1VDjrHTjhYpO0A42Mym+lgDAsa++ju+bxB2
 hv+t9srt0O/Lruv9N10hTzVJs21mCbYS/za+CNFuRCmiR6mTovY/E
X-Received: by 2002:a05:6214:2347:b0:707:6cf8:5963 with SMTP id
 6a1803df08f44-70c6769d407mr51600406d6.9.1755651027820; 
 Tue, 19 Aug 2025 17:50:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESN0BIvM6CuJAs/DUGKSJfPhZ/a+kgpIoYK/BoCUIvKjOBaanSEDI8cOaQ20OdYtUduS4y3A==
X-Received: by 2002:a05:6214:2347:b0:707:6cf8:5963 with SMTP id
 6a1803df08f44-70c6769d407mr51600096d6.9.1755651027357; 
 Tue, 19 Aug 2025 17:50:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35a187sm2325712e87.46.2025.08.19.17.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 17:50:26 -0700 (PDT)
Date: Wed, 20 Aug 2025 03:50:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <6lbathmvpjxdvcnhtncxclcdro7nv6gjwkvznnpv5zrbh2lcde@qw3gjj5lp7ev>
References: <20250819213831.1368296-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250819213831.1368296-1-robh@kernel.org>
X-Proofpoint-GUID: P8l2jSqqmcQdDOfk3Q82NNYWtlRur_Js
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfXzXvyzcbRZXDy
 1iBQk81fR+gdvoMTFEJHV9VkAYiWIhC3UnhqPeLsMLHI3gqo/1aUi51YR2VbDEebUqWUXC1TTql
 cM5TvjY7tQZY77S8krF0eGHy60EQkw7EEgEEs/ZhQ8O6bHYOoFojMrlkeRyDEy2xtfo8I2Ln7GG
 KLQeYB44Q5UbvqWoeP5THeJCFoAbjF/cK3dvNbbnRs9Qv6FDEXgM5oWD/mwYPeVi8nD7DvRHleN
 jIbR7DNhGiR6VyguYr3f9hCaxhHKbhV5Fk/p0wq4l7k7L+n0OgBsoOnDJmxo6lm8zuPCZR+rw48
 Ozg2XkNtFZ6249Y/5RtGohvKoWUnM9baJHzOGnX9k5JqL1jKo1VZUpX6VC+KMHlcdkFvItirG/b
 65ZmAFqk7Kr7zvQr7+pRtvRXvE0GcQ==
X-Proofpoint-ORIG-GUID: P8l2jSqqmcQdDOfk3Q82NNYWtlRur_Js
X-Authority-Analysis: v=2.4 cv=a7hpNUSF c=1 sm=1 tr=0 ts=68a51bd5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_lrZVZmJbgvpAXfrVDQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190196
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, imx@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5] remoteproc: Use
 of_reserved_mem_region_* functions for "memory-region"
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

On Tue, Aug 19, 2025 at 04:38:27PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> # i.MX93-11x11-EVK for imx_rproc.c
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v5:
>  - Drop some inadvertent whitespace changes in qcom_q6v5_pas.c and ti_k3.
>  - Fix error handling in adsp_alloc_memory_region()
>  - Drop unreachable returns after 'while (1)' loops
> 
> v4:
>  - Rebase on v6.17-rc1. qcom_q6v5_pas.c conflicted needing s/adsp/pas/
> 
> v3:
>  - Rebase on v6.16-rc1. Move TI K3 changes to new common file.
>  - Fix double increment of "i" in xlnx_r5
> 
> v2:
>  - Use strstarts instead of strcmp for resource names as they include
>    the unit-address.
>  - Drop the unit-address from resource name for imx and st drivers
> ---
>  drivers/remoteproc/imx_dsp_rproc.c      | 47 +++++++----------
>  drivers/remoteproc/imx_rproc.c          | 70 ++++++++++---------------
>  drivers/remoteproc/qcom_q6v5_adsp.c     | 24 ++++-----
>  drivers/remoteproc/qcom_q6v5_mss.c      | 60 +++++++--------------
>  drivers/remoteproc/qcom_q6v5_pas.c      | 69 +++++++++---------------
>  drivers/remoteproc/qcom_q6v5_wcss.c     | 25 ++++-----
>  drivers/remoteproc/qcom_wcnss.c         | 23 ++++----
>  drivers/remoteproc/rcar_rproc.c         | 38 +++++---------
>  drivers/remoteproc/st_remoteproc.c      | 41 +++++++--------
>  drivers/remoteproc/stm32_rproc.c        | 46 +++++++---------
>  drivers/remoteproc/ti_k3_common.c       | 28 ++++------
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 53 +++++++------------
>  12 files changed, 199 insertions(+), 325 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # msm


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
