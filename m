Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBLcC5ctFGpYKgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 13:08:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C435E5C9A92
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 13:08:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D944CC3F944;
	Mon, 25 May 2026 11:08:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AA29C1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 11:08:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64PAusps417294
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 25 May 2026 11:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BQBUQK+ERcgosuGR7NTC0wOZ
 R9xugN2ow/YBjTyK1Iw=; b=XVS+dLy/RFtu826qPtQMuxk+BHyD5ZXsASq4GYvG
 1UhkAaRZLGsZS1qqo60dlz+3TKh0TzAi0METbxd8pdlrtVv+XkxXo9f5XgSGEp33
 PQGy8s0G436YEymGx7nlWEQhA7U+E7r/zybdER/dTe/2pZCzf7KNSXOxQZl4uKVN
 xJDF6xqEXG5+TL8fkr8lfDSkl+DF7E2ZEie2mV261jkg9ZPZ9rIofjtsvYNYlr8y
 E8l0tHGmzbyVD+jAGNRwMc633sdcFVgqL0l77S8ZkdEtcWyrwwepctsdTGCdcHSD
 lCq4ZOYOv8UvfWLcXDDVr7mZapD3d47NCnF9OO1wxVLdxg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t6j0w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 11:08:02 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-95fc647f356so13932984241.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 04:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779707281; x=1780312081;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BQBUQK+ERcgosuGR7NTC0wOZR9xugN2ow/YBjTyK1Iw=;
 b=BnxamHIeUkW+XQUD7FnRuPlpBI7HgO9LZ/aaOTnaazx/MUTO+45Tta9mxw3J4f9kMj
 mKQjll/o/Zjs5eOIzD8sUghxhaKrfuIb9YYFU6ti2qu6JwwnZMKZi6/Nx8rKt3YrX0Ge
 O6Oq8KY4XBxA0rD7uN2xmOfLEnqs0oHP1t7MJ+SszCTZPee0RFh13MS0HpdS7tTV/O1p
 RRZy01VG9RBoD96SZKCW1g7vLRphrqXd7ziTfXYSpdoo6AdK40rR4VkU9JuoEaaFDffD
 HPmBeQzvWaGtaVEZTtDubao20F6JJdXqvKrFzTn9xlsg2lXm6Mt9RvGIJI4ZxnWZCH0w
 tP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779707281; x=1780312081;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BQBUQK+ERcgosuGR7NTC0wOZR9xugN2ow/YBjTyK1Iw=;
 b=Ho1RZrAQKB8UAAX/zUJGBhG8dr4hWrclO0J4z1+IGJmnzevzURrJNs1v24db8VLJH0
 As8Zo69TxRGCsKTmifgwHvc2X8v1B0WWYCEqGgg9NfiWuWN8McVQuL+ipaM7WzyyZR2D
 f4pRKC+RiYBNjER+J07uT2d4Efgm+fX0jzxfGqaKJbQ5VLw2j/oCcy8pxOHEbZbjj8ZN
 9JYy5kmzCHO8GdfweQgYkDQUPqjLGBWZNf3JvU60J55nc0KiOFwUR2vgVeFYnJ0z06/j
 vnVChRu47n+zJOmalOhPf9/b6YgnXZm8jpeWX7OVl9sqbTZf6FHjBREjBftE5VJzQ9qb
 iqvg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8xIKCS7oN7jMIU8/olc2FZKEkqNUYRivUJ4i+91nd2K8jSlfgGzM9OKU2iKbyciFfM6ExbbLm8CZQabg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw99nFsKR3jsH2bg+70sDWDq4IbYa1mvAvv8e/akVsIqH/dx19D
 IHsDX1ysD7UaycLcuZ8hS8iPe2ePwaq1edfrQlHu2JVQNvEQWh9AjFGhgcRiT+IVRQByPVNTYzF
 mUvinU9JfWQH8I8Hi/yqIa5xXxc6m3yvbXXfC998dsLVbdG+Cn7pNb7o0ys285gjfQdoAuamsrp
 55TCwHmY7qtM2TGrZJXA==
X-Gm-Gg: Acq92OGmKkhbvs9PqSf8ToOuUBEc0ch8LgMGz+rSIhumH2UNa3pjbGVdg6uBXDhstl4
 K/hErnZ3mrsRTA+cp4Izg4XBmvrW3/SwKl5KynuHmBx2lHA6zWZwtLW9Oir/sXExqFI5HNLZckS
 gEe9J85wy2rplADFHVGZ751wwZRxx/+wW3VVrhKFOiKmrS+hGcI4qFgL3livwZN7RkdGFT+WGN5
 gbSaOhNxoBROT9XfRRdRHgedpY56H66mOe4DAleOCdjcHWKPE9XyODeKxfn2BX0SLw7D8swtSoA
 x+BboiTr6v9STtyy69dt2l4uX8ZocmIZ05gAsI2Cu5LeD2/faHdzyU+iNLnYd2vb8+OHfJTaY2K
 PVzJSosCVbRdJpGid/YnVxjPZ/KEpCR5AbrPSYqEfsC/8hIjsZ9UHHRnAwrQkEfuwd+E7DydfVL
 enbvZ+ne9HYD+e05GXxmA7vLjPbVTqA3d/5kA=
X-Received: by 2002:a05:6102:4b87:b0:632:d8d5:291b with SMTP id
 ada2fe7eead31-67c8451a9fdmr7416029137.30.1779707281658; 
 Mon, 25 May 2026 04:08:01 -0700 (PDT)
X-Received: by 2002:a05:6102:4b87:b0:632:d8d5:291b with SMTP id
 ada2fe7eead31-67c8451a9fdmr7416011137.30.1779707281261; 
 Mon, 25 May 2026 04:08:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5aa32cf4f1csm2578738e87.70.2026.05.25.04.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 04:08:00 -0700 (PDT)
Date: Mon, 25 May 2026 14:07:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Message-ID: <kmscrht56ljnkntponlvzuumxgdm3d5s6ttye4hwtq3uaykwsj@z3pyzcib7pk6>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-5-a1d125619a5a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-5-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-GUID: LGv3OPw51ecHNLHYBqNGZ2MpzU4rKEji
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a142d92 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=whjPl3NbLinN2m9j5McA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: LGv3OPw51ecHNLHYBqNGZ2MpzU4rKEji
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExMyBTYWx0ZWRfX02SEumfr77L2
 442PBOaZm1v4w1OBqg6pw37wk5GCh1DcTBInBOvmOOdRfhZYPKHuk29+1M+JqFL+CdS5jJJJkvw
 P6qnuv415S3QItGYtFoXZNh3zpVC/ME43rfoEpm9PbIUH/bioRw6g2afjSMPzReuOPodB6DUClc
 asmkhAMB4+uRwkrV+0eiDKTEv3uqIMHML/j1XlUYi0B1vOJyJzXlig/zjpxQ4rgg01bdTQpHyDq
 SOYQJf4YUXfysQYHhHg6s+77Ks80lQyIJSPDYRe1kcMezeoLbnQIQbGVWPO1KuHPSO8i/PUo4WV
 +62E0QVXubheOaWKyktvcj0Gec4pxilqjMu2zlFcqXuqBkvauYWRRvWPNeVq3S+ilIjUrW+okPC
 SiQsy6zm2xwyTzvJZ7fUI55NPL3dLZWXWQiQ/ooqz90mNu8HJaovpSibxCB933OnDgZ9eKWb3y3
 6g3pdbplEYH5DXqBBeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250113
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 5/7] clk: qcom: gpucc: Add GPU Clock
 Controller driver for Eliza
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
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linux-clk@vger.kernel.org,m:luca.weiss@fairphone.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:konradybcio@kernel.org,m:mturquette@baylibre.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RCVD_COUNT_FIVE(0.00)[6];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	NEURAL_HAM(-0.00)[-0.888];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,oss.qualcomm.com,vger.kernel.org,fairphone.com,st-md-mailman.stormreply.com,gmail.com,baylibre.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: C435E5C9A92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 04:16:07PM +0530, Taniya Das wrote:
> Add Graphics Clock Controller (GPUCC) support for Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |  10 +
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/gpucc-eliza.c | 607 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 618 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
