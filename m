Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0512FC0D7C5
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 13:22:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D384C6047E;
	Mon, 27 Oct 2025 12:22:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69F2DC6047A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 12:22:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R84dq52232075
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 27 Oct 2025 12:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JncXzot9W1gow8/tUDBTV3mA
 gpfqF8x82foGvNCR8u8=; b=hQQFjcNu2DH5Lw59o1W3SMNAFQY0QXjO/ktVuC40
 hzC7YzQhGKGkCh1lCcdb/C/niKl0YCCv4pxGe/CTro0PzN3sR8SCaf+bRb1G1SzN
 q+VuVqXq66xW1wvCMEun5HJ81BTKuCA3TxV612EXGGbQdvrskchdpi2h51F/OUc0
 NSqKEbYWk4av6IrCCZHgQNu/VoFWqFXK3rMMy9vmJNTSf4zHBpVxvjY5YwkyfErW
 3Ps46xiotXAIzJnryRT7QeUNOyGxvZKYB+by7tQ7mfvn5y+2l69ZVBj3vtenKmSR
 dxdsKS6jQdPufQELxCcW3VKJ+HXMXz8y5LsPIIwe11cxCQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wn8qej-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 12:22:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e8a89c9750so141767551cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 05:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761567766; x=1762172566;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JncXzot9W1gow8/tUDBTV3mAgpfqF8x82foGvNCR8u8=;
 b=rS+6/mPcFtrPr9vQ+LSIzWgqPOnqrFdwyLjwUhVJiYZEHYBFRydut+6u+ebFMp7XHQ
 ZrjBq7inmIj5um6WXpVgB5/9DGzeBbsoe7r0C3y8RgHhL/rYbdb5UGuS4ziiPoVJ0sss
 1AC8Y/rt+FIf47/SxoYICNniqA0ymUIvwOnetB7yn2Frh/vwQ/4hKkgE82dxcDq7bmhO
 jAQtInXxuSCAzOpXY8BNouNfDQ4sN5foPBgNewWZVU08qX7KsyxWs/Oy6hsQDVS5KoV6
 gVtcn0gfmJr9z7fuSB1KZ32DjchYJhsrUGP8pYiLu90Ap4dzezsQPazdAZgBHXR9fMmU
 fA/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlZD3hnGTOBGV7zYVKmwcgUkqCUHx1uCqLEr035lFuOWByxuGE8i+N4EU9Gm2Af2yXQKK1rpFWkf4itg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyVuVPf4Zs2oqzEhJTfrxMcpKA84xk2Ohw2bMMn876kS0icGQ4w
 y+DlvIorlXvz5eIIIXq+BMuBfMn6E+UZ3gE41fXem+wgGP7zhr5HeIw802QjQd3cGpoftaaHw4t
 oRaRdGmxOBBy79oqFqhzI6j9oS5z/iE8VlniUC5SdhkHK0XEGYbm28KT0J1i0M8rTsB5UGWadkS
 1n4epA0hc=
X-Gm-Gg: ASbGncszPX9qrRhNqXXOAByZLrmG3IcE49FmnhdHJStC6m02KUBPFSI9lumD2eQB6Fd
 t9PPx9WmJTluNlfUsa1xpVTli/rpIh3NszxDiR6498wpzACPox8YSgn/Zcz3pEvRd5sxgMQ1OOU
 0H0UFJGj6bVRUZS4+UdofCezdKTV65h60DojkZZ4Wd7VGKsfNNteNxZRKTYKro4dBHfEnSDaVi9
 EOUL9AwMJHvay4RBxonsVr4SCPKHCyrz5wXjbRI1jvqnhla551HS8rwvTJMksGaMYNDjrm2MUGC
 Q/T2neRHZqiDFXng9n9/hZQCQCOsrMaGnn748YJN6y0vheddJxKzasAUT7BciMbIEPUm9gti0Kz
 40Y3FY0FG6RkPNzFWyynPHzaoJlKVOjyYxLVoku9Lp6kPIYkTk+DKUCzcFPf3CuCnJ2T2D/lAav
 Vx8nEkVKnsrU7W
X-Received: by 2002:a05:622a:353:b0:4e8:9f87:1f42 with SMTP id
 d75a77b69052e-4eb94922adcmr152956031cf.69.1761567766312; 
 Mon, 27 Oct 2025 05:22:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH79d7Do90KoVZ1tYBoBY55fSIjzc3SaetN68K8JqBrkVyDzQwzXI4DnjU4YyJIchWS9APnNA==
X-Received: by 2002:a05:622a:353:b0:4e8:9f87:1f42 with SMTP id
 d75a77b69052e-4eb94922adcmr152954761cf.69.1761567765265; 
 Mon, 27 Oct 2025 05:22:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee0e0246sm19655221fa.49.2025.10.27.05.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 05:22:44 -0700 (PDT)
Date: Mon, 27 Oct 2025 14:22:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <g4ryfonkdpnsgqo4brx2dymo7o35jkndc5kkhdybhyvwo5rust@jwsivdbievvi>
References: <20251027115022.390997-1-sakari.ailus@linux.intel.com>
 <20251027115022.390997-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027115022.390997-2-sakari.ailus@linux.intel.com>
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=68ff6417 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=QXDDecBx9f-8Df5VMo8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: SCz0s1aKu6JZFNxX8PllbFoxd4iu8OVn
X-Proofpoint-ORIG-GUID: SCz0s1aKu6JZFNxX8PllbFoxd4iu8OVn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNSBTYWx0ZWRfX4F0SdzpB849P
 /qJ8snf9b9xoBZXAUCfJv/giCn7GsTz1WN7K+LnSEMvOCxlvzHEzSRRPHSTbq/pq1yyPgmrQgJi
 Ma6TCTK2NpYL0zR7b4qseT+hVudXLSLI3H1umpz2xK6KwAIxUM1kCtD/fmU3VV4aFHvbecntklJ
 8q8r7/aoO7EdVNAYWaLI0jkV4btGJqN+dWTpKn972Agh3X7doFyPpbq/ABb3mkLNPm+J1maKtfZ
 Cfq6Bdl/vXphrQMNUR9UnEHPsBMdgmT67U2XuL7Ept3dNDGxbBgIIP3uNMMlfuJe7UTjlcdSFVg
 2q9YmkEXu2vVHyeV54iSTnB9rONzL7k20SOa/nTSYcWodxyXbRiHxjzNgkTH6q/WGrC6wvdzu/P
 ouPt7RCgp3XLcDHYScWDJ0GkpWtSbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270115
Cc: imx@lists.linux.dev, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Ingo Molnar <mingo@kernel.org>, Michael Nemanov <michael.nemanov@ti.com>,
 Roopni Devanathan <quic_rdevanat@quicinc.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 linux-stm32@st-md-mailman.stormreply.com, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Paolo Abeni <pabeni@redhat.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Stephan Gerhold <stephan@gerhold.net>, Liu Haijun <haijun.liu@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>,
 Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Paul Barker <paul@pbarker.dev>, Roger Quadros <rogerq@kernel.org>,
 Wei Fang <wei.fang@nxp.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 Alex Elder <elder@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH RESEND 2/4] net: ipa: Remove redundant
 pm_runtime_mark_last_busy() calls
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

On Mon, Oct 27, 2025 at 01:50:20PM +0200, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/net/ipa/ipa_interrupt.c | 1 -
>  drivers/net/ipa/ipa_main.c      | 1 -
>  drivers/net/ipa/ipa_modem.c     | 4 ----
>  drivers/net/ipa/ipa_smp2p.c     | 2 --
>  drivers/net/ipa/ipa_uc.c        | 2 --
>  5 files changed, 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
