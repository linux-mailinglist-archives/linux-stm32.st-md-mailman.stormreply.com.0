Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FhINis0eml+4gEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 17:07:07 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A079A51C4
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 17:07:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0443BC56612;
	Wed, 28 Jan 2026 16:07:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DE11C56603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 16:07:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60SFs4NM3920918
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 28 Jan 2026 16:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5wT74JYFNoQcS4wI1iniyZim
 QN/JHMCSXvXZOTbFCAs=; b=DbEQJlZUCQ0DWI/iv0RwoFK7HTXK+pjbIfWIdguG
 mQWQTkBX0zYy75o3Le2DjFYlhdXmkn1VgL+MmaIhWeJ13JwylSNZwzATp1ePlewD
 z9neIrgr/RG38y3yvKTTCGospOkypsDkgbLtfHMq/alPqYUYEqWAsRfK6VDLTFIS
 aHxY0CyUt1EqlIHZy1LgXqIwPIWOz4gfD5HhznSy2ydxtsGsFV7TI8TxKl9v5iYI
 SMHLpV2aGr19koOv5ptwhEIAPmjpFnmBG0C5LR0AMvyljm165Vr+N8RDgJvcHgG3
 ZqJBBW+zLOtSoEKi7+/xlRv4Yi2owlLbEkiLXHYRQv/6Gw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by211c3vn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 16:07:03 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-563642dd79dso6844120e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 08:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769616422; x=1770221222;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5wT74JYFNoQcS4wI1iniyZimQN/JHMCSXvXZOTbFCAs=;
 b=TgX2qSwwnT98nGr4efIBSFnuS9BxCfNZRORkEGfvjfcreRu9kZcZP5UluXXk7ZUV7b
 2HYqdoCJhnPiwehAPefgO7MDGn4A9mbyDSOx1UyV0f3obkUuvobi6CNtls1g7GP6tV5M
 ENM11uvLuksT/fKDKbe1D5BX7WFhtZZdRQckH2pgSFrJBB3orIv49EPX40/kIJ8U7vY2
 52y3aWtS1GOmF5N8haw9D9Ut0yqJezD+IwKSXDZXRrto7dFKDX42vv3C8AcmY8GXLocY
 /HgbS+fPa1zGKvrTad9sDmxlTwnseckN4g0X/5MocxHBGQvFajd09qzeBdV01n2ojTgy
 8iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769616422; x=1770221222;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5wT74JYFNoQcS4wI1iniyZimQN/JHMCSXvXZOTbFCAs=;
 b=BZZabC7TxUNdQRDl924fZ2Rj8r/6A2SXvf1jBqO3s+G4c1cmqhgJSfjHDkjKVm6hh6
 KNr3zsoVwfuyugb3Wg4YuN77pzpSFxUZTl37uDI5LBz17Ssvo8tnIGIj0lNEnaZVPSg4
 oJw2tT0Gow6zoyHo1RmD6qAormBMDHvNBfH589IdLL4cLX7QLFDJG34OT1Vims6gHuqx
 06cwo5M/Sit5k2KSfAqMqjibHR3+j0ymH1PXGJSDzb9vvWKF/t4HO+hixBQInvhPhoeL
 DUfotdot5kWLBUi816dzZmmvZIvzV5Qg+u2OZzobSlVnPApw4JKVR8CygXTpZ8ubucDI
 oo0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW07+a/oi2c4L4CQfhOp5zRvgm4yPs0N2RhtGE5LGbMy5WHkfLhTkSck60YreyeELFVRvaqX33ODr9eZg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwE7WfJfFVgVzgPaoRSNZAK+QiRgr4X4b4ybgkO/E5zFFJjz0Vs
 MN8HZQWtzxo/dnnuxbmsFLSOUnaqF0qoGOXmSqKsd7O39QJxzWP5Fd3ocwAH4TI0llEdgdcsywR
 LtBaHCXMzCOZMP/uQUY41FPQ6olIgaoBOm1hZZ4tQc7veaLw9WWZICDTiDfX4J/KGj1MTsB1QhF
 JKdsoV9Rs=
X-Gm-Gg: AZuq6aIqc3F+RKYxmz6dt0unuqtso3njsT74eNQvebN/eqAc3/sy3OFGEOphDBxBchv
 aph/AdWrfSasliZVuPiXrlF3L98DDo8je7Uea2oBiT5y37h4+2Kz/+wCxS4En9rIsvGTI+i5rTE
 Ag/DFv3ZkThF27YdKkjHtdnfHgGtWWXv17F4xuwARzX+c9890kZ1V37E7TqszPpMdM3vrkWp78o
 GB01fmhuYGmD6xkiitX9ec6tp3fOI5qeGsYRp+YrXfouAcpVlG8pIPoGZraFslx5dAsbWZJya7e
 IQ5s76+wep4ZRsLsIlZ1IKduFz0pf0nLaQW6DJZTy3Szn3ScsywvrfN1CrkZSvYssiPehPAzSC+
 mHaOwYfnL+wi6SHvJSb49BGbW/yp/12mQTqua6dqyuuHVBT64psGPdsFN+DVghXRFeoUyjNuJOJ
 oCaQvv8GccSHVtIRbSG0bfB+A=
X-Received: by 2002:a05:6122:7c7:b0:563:5070:ab4b with SMTP id
 71dfb90a1353d-566795c542cmr1437745e0c.14.1769616422312; 
 Wed, 28 Jan 2026 08:07:02 -0800 (PST)
X-Received: by 2002:a05:6122:7c7:b0:563:5070:ab4b with SMTP id
 71dfb90a1353d-566795c542cmr1437707e0c.14.1769616421853; 
 Wed, 28 Jan 2026 08:07:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38627876ab6sm3997671fa.49.2026.01.28.08.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 08:07:00 -0800 (PST)
Date: Wed, 28 Jan 2026 18:06:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Message-ID: <mpb5lca5n63vyp725nfvhzcyckjzfw3qxhjrwrhsxvbaykkcta@lhq6t2guwm7y>
References: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzMiBTYWx0ZWRfX4WhtkiHo2fsN
 N5ZyR0V4p8HSKYr6VxIH/lFUEpd2n5relkF7lUDK95nyn4DxehZxGkn4HVUdU2am4aUNwwQqFHj
 dQZxSLn913NqRuTjOVRIueFqcA+ABRUtOxMKaJUNWJq/QUY0zi4wNxIHSfu1Sxp+tWB8eafL3p2
 KT7exKTuFHoq6OYVhmqbFGUf2cqeG5FKBBMK5N1wGHCnoJiGPsJ8AHtjkpp0QU3S0N9If+U+M07
 4RGH5PQHM3YU83UsmbatNQJcxWyv4eXAH6Ffp8g9bI+oUbxZvheN+jciBY/UvFgCOoE7i8fb6Sy
 zt9zCbSkB8UNVYXHAGSdzEykZ05WN8dwDH8/W82dvPLur6pXKll2LfwenvuscHB6X0HeCCJGgX0
 Ixr2bUUXBxmC1YAi9R6pJG6YwG3dePf14C17voKBmTmzujG5HGPzFfol5v/UxRGn9XzsSyArKDS
 /dZs5E/JfjpLmcEgTng==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=697a3427 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LBVU2G7aICa-vlctToYA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: xCkQ8w7cBhvugl96FM4hlpRi-_ZSxxu-
X-Proofpoint-ORIG-GUID: xCkQ8w7cBhvugl96FM4hlpRi-_ZSxxu-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280132
Cc: linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] clk: qcom: sm8750: Constify
 'qcom_cc_desc' in SM8750 camcc
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-clk@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:mturquette@baylibre.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.997];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,st-md-mailman.stormreply.com,gmail.com,baylibre.com,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 5A079A51C4
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 04:43:07PM +0100, Krzysztof Kozlowski wrote:
> 'struct qcom_cc_desc' is passed to qcom_cc_map() and
> qcom_cc_really_probe() only as pointer to const, so make the memory
> const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/cambistmclkcc-sm8750.c | 2 +-
>  drivers/clk/qcom/camcc-sm8750.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
