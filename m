Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLYDJCHyt2lRXgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 13:05:53 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACAB2991DC
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 13:05:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A8F0C8F262;
	Mon, 16 Mar 2026 12:05:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 040FBC8F262
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 12:05:51 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62GBiA4s2128555
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 16 Mar 2026 12:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=; b=pNpSDV9MYHjH3m3u
 W7UJ4st4HocJne8A1SEc7ryGYtLWqc2ksDPxIIL8M5//pxk215liAyLNcy6s3rUm
 WxmB+GGDGQBY0CiGaZMn2odOdtBYFlsaXMRHH1/KdTLCkBgXU+g3KEg4PlzTLwjc
 nC9Osf8wm9qC+95l7Er9+lkZmEhPJFJDevy28b/NZSRPHEUGvW5bLLeI1UmUBkp7
 FUua8LMPEdG/hIlids8UzCfJAkdURCLRvfCaOTfbNI3hVwRE9ijGhwFQ8pDoz0qR
 mEvmP7ycgXvD5srBvNdgPAgFNPytbw6wI5IyshwlY/4gBOQpNVgf/i07Q0zuReMc
 rqOVpQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00anrvm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 12:05:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-50900e9803aso302657371cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 05:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773662750; x=1774267550;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=;
 b=NlHyTtV2Hdyv5s9xCuAFt7wcDTkAGYp/kF4XnvLwboLd3xG00xUoHdHS4HvGLeRrqf
 yf43Esf1DasSaP6FaKPn+L8CJHxjHyWCMgYLU0J6WTA4ZlY2t3klHHx3TcyvGhL/E0iP
 dg6D0eYFBHdKCfJwlK/EHQ/NM4KOh1QQWVI0GROSEEfzRpy8W15B/klPeP7QD/VXTtnw
 45/r5T9lGel9VL2dHYrtHHLadTX4nzlQFBlyFZn16jTRYt14KaktD/tvqtH2TTcBtNxQ
 Cqm13qQFYT0fDJqTdNEvU7bR4ts0PedGJc/kLWhgzQYEN5RxwyKwBtir5aVOFx3BOiGx
 5zSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773662750; x=1774267550;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=;
 b=sG96HBUUAgbN5roM1UAk2P0FnJEUCXLCDiKX6xDgmtwedxO5G/cdx62XUQZ5J3lmiy
 jGuIm06Xa3BsKKuGQcTPwPaPN+54NwcZYt4OgmoHVRaXx3W5a8orbjKjAjb0iHkozoIh
 1ND6sV8gSNZA0TNs+ljLFlS0grL1yhbFn1OVoXz5e/i4FFDVqSiCW1qbyaVz8fdcSB+y
 J34y4fSVvqfzALb7Uo6kf6nsjcV8pso/zq/KRGhG6wODlyy3RfxDyN6OEdmbM42PB5r5
 xGPJgjN9n8fu2ljL7G/DA0mG3a1lCyU7uIAVOOiBJ9BuRedlJHRB2tZArEDhXmOUvSNf
 IuRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLZ7LIz6zBWQNyFo/4DE1pf0FZ8EZH1EHzTehHCW7rgLdxcp9ofia8zf0pJT/83Elir63muVsM/Rqahw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw/dDAFhnC2okYLd4DisLPnZcnt0Vk2w5vLa74flK/rzrWGhfit
 cmMIn28QUybN048ZUZ2NzIJ+LvxUresvTLTKT94WGObUJ5XZXlx5ewlFL8wkXTG9XmB4WVx0af9
 qntxk7IzApFV9Yop/d9+SXaGK6QPf03YTdCMq3TZFqs73qMOBlRnsdckTugKkEbq1vkQCz9XErc
 NeOcY0y4o=
X-Gm-Gg: ATEYQzyJ0yfYstdTIB3McL7ckNSMoC39cYS1fFbJapjKPlgLPOBNGR5b2bdXvkMrwwQ
 6YpUrOa78LKgZPGmVLg49X/LxUO2c1aSgXe+OUNGFQioUyI3AL7BfFH03S8+glDaMWuvoePxknM
 1Yagqd3j/Ehf8CY2Pq9cvmVSsH8slxqGMSpuLIQ23Buqi8eiQ1/pyCOIB9AB2uzH2oh3i/dmkiQ
 8hNEWSSMTubeTAvGMt+gE/SmkozeX1+hIMP7881Jvjc59BLTJo74t+5sML0GOTp7Bo0sc/vOpce
 tHcX2EJtohsR0MGOoznquLcCUjPZCZvq1QdDeZUsHEc1nuDlFgYhwhlPFLS5EhQNhpuTiNBy7Wz
 ngfW4fiTytyj2KH3QiC3CfvwrL4VsGYAUSq+gdOtfWagYlPZfFJU=
X-Received: by 2002:ac8:7c4c:0:b0:509:3f5d:4fb6 with SMTP id
 d75a77b69052e-50957ba7484mr165094071cf.14.1773662749691; 
 Mon, 16 Mar 2026 05:05:49 -0700 (PDT)
X-Received: by 2002:ac8:7c4c:0:b0:509:3f5d:4fb6 with SMTP id
 d75a77b69052e-50957ba7484mr165093061cf.14.1773662749103; 
 Mon, 16 Mar 2026 05:05:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe2273d9sm46468513f8f.34.2026.03.16.05.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 05:05:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:05:10 +0100
MIME-Version: 1.0
Message-Id: <20260316-qcom-sa8255p-emac-v9-5-c58934e76ff2@oss.qualcomm.com>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
In-Reply-To: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4863;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FNVr79Fi6sLZ+qldLv+chKiF5qjCh0lSqoNC0bsdcWI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt/IIT8poUkTMwCdDoAqbmTNuqoN3k68JOFFxl
 RLzfgKVKIWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfyCAAKCRAFnS7L/zaE
 w0K2D/4rDGSTW0SD1QyIyyfWah8lyX6rA5A9XyFngToSBN703DgZMDNxYkUeXeaO/SjXmif2Rcm
 OObzFgkf7GTijwxglaizo6Y/hywgBI7dMmaVNl9j2+5oF3++AMNlfsr/AT2s3bQtpgKEmyipQ6c
 9aDRKwIipEeGEratxlc6mHDPicA7dXVwKDrzk67depSo/fuJjnCim5/FHA/QBySqVcNcLH3D218
 Rssqe4ejGkZcv0TQgFjh2zBBAWNSqpHIxNenriZBsY6dR9pH76Uzm12ESxwaCrY7/z2QG43RO3Y
 N91qkaKLR0a9FI9tXbRhbmHKd8tNojtRsSu2n4jF+i8QvsMhm2WTlLBSnHjDhesrLrcES9fkM+N
 VnrWOh622GFNqlRI7X+3D1YxkjoJz1xVic/3EOypyDur1VbMk18dFaYPmhgMTfEO41ivU2CHqgR
 XlYuo6VLOjn5/8FVaimtnNGGHf21jpTXVVrK8e9WSojBwnRN0FfYtRLm90dB5FKFfaotMb+Spfz
 BuAIY3gGvycrCxyhL8y4mFQdPdhmsQiGBkCSUXsWFh+JeD0RbqCD3juKRHCepuzDEvS8lTdrJ/J
 ZgaFYz2x7XAp7j7NA53BEhQH7ojIeBiULr4X7eXdvolOLzeqa8fqp/sr/icnIetgM9z/F/5Y5If
 4DQ1nQx0YViO78g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: SG8YtwLu8vwxbeN5tfRoU1R2AnyFF8pW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfX8ChWFBhR8SZS
 SRHRTf2cFShViq5W8rRADYgyARgI95Qn/kzFT9kt0z8EQJzLRg910MoACUuR+5GoVCVMeqVdKsl
 NyUWQHKf9idHlsiFXFLmc0/CnNr4Oa/MkAq32kyKc1ccdjJ76Zv9V3ewrHwGDPK6IJSqrdkXXt3
 1T6hLafeZnNB77luHQ2gw7eRP1uK9UwyNi4uWa5F7cNu+LXcrzpiSNezK86TOjJic1ivJQEgu0Y
 alB1aIZArT/5l9ojRTuBLI0hLdMezNjHI5NeTJYQy6wfobzuxeXSySJfR7Id0Lunuk8NUMCP8T+
 lOr9hop869kWRQJOZ7I7a8LPN3OvuQt2k6qB9dkT4Aqi5K+qJWC8CZWtVDyrCWDzfnP9/BvoZ1d
 r7Y5/f2A9A8Nifmy5u5SmITB6B2rLH4dBdT4e4+3koodmtKiaoiIT4ciGalabVHS4G5n6JJksiZ
 vEYWiDh5JWoNChdb91w==
X-Proofpoint-ORIG-GUID: SG8YtwLu8vwxbeN5tfRoU1R2AnyFF8pW
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b7f21e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=TTAMOEIJuQy2Ho-tp7YA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160092
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 brgl@kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v9 5/6] net: stmmac: qcom-ethqos:
 split power management context into a separate struct
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
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:
 linux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.674];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,linaro.org:email]
X-Rspamd-Queue-Id: 7ACAB2991DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 40 ++++++++++++----------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cbfae18773c1193cd640f07824f5a66d68f9634b..f32ff0d9ce513d8270c8db9c549a79778549df59 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,14 +105,18 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void (*configure_func)(struct qcom_ethqos *ethqos,
 			       phy_interface_t interface, int speed);
 
-	struct clk *link_clk;
-	struct phy *serdes_phy;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *rgmii_por;
@@ -194,7 +198,7 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	return clk_set_rate(ethqos->pm.link_clk, rate * 2);
 }
 
 static void
@@ -670,13 +674,13 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		phy_exit(ethqos->pm.serdes_phy);
 
 	return ret;
 }
@@ -685,8 +689,8 @@ static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
@@ -700,7 +704,7 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 
 	if (interface == PHY_INTERFACE_MODE_SGMII ||
 	    interface == PHY_INTERFACE_MODE_2500BASEX)
-		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+		ret = phy_set_mode_ext(ethqos->pm.serdes_phy, PHY_MODE_ETHERNET,
 				       interface);
 
 	return ret;
@@ -712,7 +716,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -726,7 +730,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -819,9 +823,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+	if (IS_ERR(ethqos->pm.link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
 				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
@@ -832,9 +836,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
@@ -859,7 +863,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
