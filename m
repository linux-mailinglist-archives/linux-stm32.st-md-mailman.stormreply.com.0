Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB733B06255
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 17:07:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53210C349C0;
	Tue, 15 Jul 2025 15:07:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A32CFC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 15:07:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FBceoW004454
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 15 Jul 2025 15:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UFE3yd+yxu1P9RbRQyZIroNt
 ei5T0YAfVddPN3zIsz4=; b=kms4CHhKguztPZrh6aMbRBtnl6d9uGu4uOFm50lw
 iMEm3Hk1vAypjt53Ce3yleNqozyM/XTTCxr+e4G/uDCfYHbXQAg9h5hQNPK9y3I2
 udYhwnexMqZsF9/inyxAfUZ76hBWYT3td4TY3OazGAs+vHQuinCcwiorjzrk+l0g
 1Za2lALAmOj85o6c8rScrhk/vR+IhdCd7eBxxr3eg9cgxubjapge0iJaHFWolH36
 PYJa/KbYNYKjmbLO0zdUTqedsIENjxR/LKLsuUc3U4b4zj/FX1nbUJwrZnhLZ3fE
 bV+7Tw6R8Bs9zY0xs7ikJuxKj8mBvjo/d/+R4DU3M38Xdg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca1yht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 15:07:43 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-73e5582ada3so764987a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 08:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752592063; x=1753196863;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UFE3yd+yxu1P9RbRQyZIroNtei5T0YAfVddPN3zIsz4=;
 b=DfEurH+VSmtHit89dtIZt/cPRE6/Xgr02LA8gk203s5mSJ0unuFnjr1TlUvP1X6fT1
 Wpi65BAl+Co++M3SUCsLF1KFCmXXUGKwL8eu/mHlSMIO2B2vCuY5kCRCcTLVh+a6JHBZ
 ct3jM+kimIAktAdaXJ+47zeW0pDUsTxrk+K5W0VGO4IjRz0yyB2Q7+Bd9Zydl0SazCxq
 mxZDfG3nXRGLcZ5kL7Nkgly6U26RGLuXS08WN9zEkOqEVnG/cXjB9netM6qKb3nbOFvy
 V+JrHG1PqCC+CB+hP0PxQMKyoqsGkGAGN5mg1QaEgtnK5v2NJVkM+HnjrIijHx7P9vlm
 J2Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx7C8tkrStnrGJbFdorcG7yewNdXhUYQcwKlkohDLdtefpW6zhQ16RACO80Ha8DrFrDBQNVETZ27dKvg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxKy25ITSM05aINg0zxE3es0F2gsEIZqwUS9nHJ2Bq7W8VTUUOS
 9CaB//aQIWW7spwZj7/DnduLTSqL3GjB5v1EeN3H4snfiGTTHRSq4LYNfrlV7KnFzyRQ6XVk0xe
 B+H9Se305pYT5DrTc0bxF1UlX8jeA6AKADHWLIdVcZPtmV5cjomboEU6mRPfuUcR7J91S3EKErM
 ZzT3sctoo=
X-Gm-Gg: ASbGnct8IaNmLNg0xoAVfcoatFD/0O/u5nHhboRWvT2oaSND5egVyjhnXkkkcPJFZXV
 v6JzxJyr04sASXBAYaPjcM1qFxOt6w9QnXoljnN0xMl7RkNBGoqxPENkhq43aJOzzsX80Sfnys/
 jfgeQBG3nloya328aoRdcOM/DGcro933U0tbMtMihsHzh2tNnrt7T8ApA5IcAzeFA6pW9u22TwC
 w91gAJlCiqHcXdqkj9ushiQFMrMYKvoFcOqFmZ6tIz/OhDZdeqboodSmT04q3W3syBi6aJ/6YfG
 WVGBwRZKciGMK1gUsfUmxhhZ95Vz27xba95J06awFsguDv5OaPbfu7g7c4xHcaB9FOvTo8Bp5T7
 9ylklL4rRdEr+4/kjpkrl1ZpJejBEo2T7egMbpXc/W7K94qIccjO8
X-Received: by 2002:a05:6870:5b96:b0:2ff:8f89:950d with SMTP id
 586e51a60fabf-2ff8f899b18mr3018596fac.11.1752592062998; 
 Tue, 15 Jul 2025 08:07:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzt/a91mT3BodYIFDMVy8jVt1HoRKIa+1bUOyQbH9aZS0Ib97nHGb4Ty6uV5H10BORptHD0g==
X-Received: by 2002:a05:6870:5b96:b0:2ff:8f89:950d with SMTP id
 586e51a60fabf-2ff8f899b18mr3018555fac.11.1752592062451; 
 Tue, 15 Jul 2025 08:07:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c9d092csm2317122e87.114.2025.07.15.08.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 08:07:41 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:07:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Message-ID: <qk4v2znryznnvg2vcye2m7taurfhoozjjdtye3fmk4fgawm5jq@2qlqgg4htfnl>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzOSBTYWx0ZWRfX+uiYqZJJdLkV
 PaPVV3Xx9KUJtK6TqDRQYfpOJVXAc52eORDxTTUzo6dFL1bRqUox2om3VznKC5qP5xJZTQZ9Yr9
 hOsaIEHKyGIqawnUQNkTKEjpgL7nO3uxMYVe/xLmR6sCYbGwVFMUYgBHJxwTL9U6khuLNVBPmVd
 vEzouqLOnNDAnKoDY9sbDqAAwdKnGEckIqUNlkTEbZE1Fgyv8a8rrJXg1280d7TK81jmnQxlEbL
 tkpSscn9gpmqL5xlGM6FO36ZFCXMkvMLjoSq0GYdvP9lm+qQHGHFWbpaGpuXYlDu8LsOjgw5Ucl
 CkYhoZBnBRbgNfLqkm5SrV3YmLysUmyvY0/wf9QG3xb+YhHRoO5yonr1XzakfIe37kMLEvrxa6g
 zSSEka6lrkbHBD6Or9zXri3ZS2kR+vJGFj92cmOBaPAsoMsZ8LinkMdtgevWZtdnL5pyAEQr
X-Proofpoint-GUID: F8tXQgYMKsn-loZyPoksBgI9-p0oFggu
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=68766ebf cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: F8tXQgYMKsn-loZyPoksBgI9-p0oFggu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=732 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150139
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
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from
 round_rate() to determine_rate()
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

On Thu, Jul 10, 2025 at 01:43:05PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please take this via the drm-misc tree (I assume the rest is going to be
merged that way).

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
