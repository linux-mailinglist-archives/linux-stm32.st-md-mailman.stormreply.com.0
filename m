Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JH6Az+tumlXagIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 14:48:47 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E7B2BC4F2
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 14:48:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 678BAC87ED8;
	Wed, 18 Mar 2026 13:48:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D8B5C87EC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 13:48:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62I9MvMQ3358513
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 18 Mar 2026 13:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4obHx+u6g9OIVr0W69Wxv02v
 /gbopfLolpa7DVkHWQA=; b=HBByCaYNLq2865gIvru4VJjWIJhjEmPeRFhpRIqZ
 7R2qcqEgpEb1oQOtNQ4jMsGe3jb9cfwJKUCK7CHB53dbsD93l2hIw08dAwbLStMO
 MDwYr8jryl2QxO7B7hVxWPe901xVoXUHQQa5xK1O33STPzxIFW342YRhdl3EIamC
 SwTkko9sdmfVSXfmORfPToOEd1ryQWSXym3MMYKNka7abHVDgydx3prlqTVHjJqD
 AjF40NRWhGPGbTaVczkHqZ/e5r8rjx0cy+FLmOZbZF8A6XDTrHTLkXiSFVsrcNrn
 P32NNuh1WA80mjGO4+HGnN2KFpkjHX7864Zz1MVCD+PJbA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb0y4y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 13:48:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-50921f7da67so81435771cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 06:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773841724; x=1774446524;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4obHx+u6g9OIVr0W69Wxv02v/gbopfLolpa7DVkHWQA=;
 b=Rvyl5yKy5zMaAMfhcdRgUkSPz2s/RdjblkUmPGa1ZGBijSx5w1cXPtp1BuCd33Vc11
 E5wwz2P8SBrKKLiH4xJKTUD3AvlS2tmjLn1nwQbgcviUeoqOCltbHe6oVSEObVQMzIOi
 emvzGBUcuAa5bez/jI15UaKjyls2acLoNDiKyQ0xLCFMaByiIH/fS6fPbapVuG1v3q7j
 yhvbMiq+qkYYcSvSAjQXNBrmAjdfxYFi8tiK4Yux51lu2Qgyslv0Am/2VrGCThaoa2Zf
 w8dzFf80Pp3gv6OaLLqEqcb0JoySkihVInPb+zuj0G11Yb53YWOESU9ECdtdtcjxvVZQ
 Wl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773841724; x=1774446524;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4obHx+u6g9OIVr0W69Wxv02v/gbopfLolpa7DVkHWQA=;
 b=V1sbhK80rp0i9ghLj3EXL+jQUZu+/0i0oHd7qZgnZKn5H3jxsUQ7knGq6+dTmQq5eH
 moek7fsYcMonCAFX4J/kl+4LqbdUnS/cDPNgSLXZE35QwzM6kdAvUx8ODihNvC+YmaID
 o1tl1v95TfIu3qHTQp+XmH5nXEu9ObsrdgF6PP4zj5ugdesm3Qf+eAoCkmAAlvUaR46+
 L038IDx1zKiKa16apJqJQubHA+gLFWoxT7gEhx/Rvz6Lkj+1S5ZaoyTuNcwv6V0v4IMg
 N0NEGndl9rPiJ0yheM7PKXYhKg2gCqgVIfeJV1rpYhKY/w1qHl5ODv8ZhOqN/BdXekce
 Fxxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT5h5uW7cXfYS6XYNzgPODqjCo4wlkoFO6bbTnMTbVlmhLnayu4PMhgmHbSHAQbamLC5SduY3+BWy7rg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw3Pllson7BEZfY4vSUg/DR0oHCGmZ33UDr+k01qcMe6F1angDA
 BAIIX4FcPlHfcZQj9KT7ivYg06kT3/cPzFcN6OF4MIMC9oC1dj7h5m3wMRbP01gnyzaIKLgzf4O
 Fn3J10zPYGw6XVUNyCHbub9BN3J8efCM3wDYdbvxTSI7vLJ/nmgyuScyLd9Apc7zWhIz9nPewOg
 la9rbfRME=
X-Gm-Gg: ATEYQzx1cRPAXUBoyehR9moKQu7eDucixAUZ2LvQAIovK4EYoEzjAvkavyKKl6rsqVG
 h8eERYe8c8fCfyvJUYRzHYTVbDzmMcObvcAafOu88r4QRY5NNpTuusQpdqaoQXrmVgZI5wI1Lh+
 ZpTSsO4w8AZYO8UiyJCi++8x8tnDXF0kf47vKzS+tAKG5nl+o0M/VO8M2SMlXGQaCegfcy06SlF
 0A4ft0qE5UieD6SAeTsz0TXZHnHfC9a97p5gA4juCrHmqSkW8b8bvyS+1dEqkrZsngIAxBWAumj
 lbxDmMFnKLiL7TOAip2ON7p4qQS1qmtbOzWKmH7bg7DnII8Oxtkb77hoNIshDj1VIPL3D1OcXey
 PFVRj+QHYvNLdCD/GlefJkPc8jTP0ozg/0R2OSt5Yc6APvHNpCqAxY9jCJTcM6WyqQDNpVO4PmD
 LVjSP80BrB+5QDk+CCGuWf4sQRt626BlqtZog=
X-Received: by 2002:a05:622a:44d:b0:509:20de:4acc with SMTP id
 d75a77b69052e-50b14880cb0mr44388641cf.47.1773841723609; 
 Wed, 18 Mar 2026 06:48:43 -0700 (PDT)
X-Received: by 2002:a05:622a:44d:b0:509:20de:4acc with SMTP id
 d75a77b69052e-50b14880cb0mr44387921cf.47.1773841722849; 
 Wed, 18 Mar 2026 06:48:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38bd5156e74sm6353381fa.7.2026.03.18.06.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 06:48:41 -0700 (PDT)
Date: Wed, 18 Mar 2026 15:48:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Message-ID: <7u2esescnuncs5rvzpjnggxhwizbodwcmhcyw635bgelg6xpsx@n4m5vtwuwuwl>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: I7VQAZokmC5KuNDHeFVIRB8E5yg89ILq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExNyBTYWx0ZWRfX5a7STSMMmGh0
 d7D88VDxqLoN1NkNVe39Mrn5yhkogezcdfn9S+C5e8kqZNApNxRv6N3t6At5a+UnFX6CIZFmSi2
 W62whq6gWeyKI/sHiypjYfgx2QcbUcuarWgqLN1Ak5ahmNBH3KTYowZ4d+JkDa98Y/ijwiTHpNB
 bWVp7oOA+QBP5/lupb5OCe5uN6XpcXDvICy/RM3oL0OM2WJnziH+WYB8Un60+1+j0Qlod3CjVqA
 zRDEulUnssdUzLZ33GYZw9hm5nw9ByyA3pqgv9ZZEdwA9nBdciPpOu8cXXVAWcWS0RZM8iF0sep
 Ak2l1FaJKXpjz852pNMGKOnWGBxGZpwdoA9yBZPT8p9sicgM6FwQTN4X82ypbabKmADQqeA5aKu
 6Mpzy7IXBeS7/T7/09u4sjTYCSFISE0LM9Y+5pD4NS1hFJGG633aKb5sWt4R7WE7gxkGcR0dPtb
 +fjU9Evb9dJkOQzB28Q==
X-Proofpoint-GUID: I7VQAZokmC5KuNDHeFVIRB8E5yg89ILq
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69baad3c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=aywfhrhUYFgYpfM73PUA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180117
Cc: linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/5] clk: qcom: Cleanup redundant header
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
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,st-md-mailman.stormreply.com,gmail.com,baylibre.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-clk@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:mturquette@baylibre.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	NEURAL_SPAM(0.00)[0.156];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: A8E7B2BC4F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:08:39PM +0100, Krzysztof Kozlowski wrote:
> Newly introduced drivers keep repeating same patterns from clock
> generation scripts...
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (5):
>       clk: qcom: kaanapali: Cleanup redundant header includes
>       clk: qcom: glymur: Cleanup redundant header includes
>       clk: qcom: sm8750: Cleanup redundant header includes
>       clk: qcom: milos: Cleanup redundant header includes
>       clk: qcom: eliza: Cleanup redundant header includes
> 

For the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
