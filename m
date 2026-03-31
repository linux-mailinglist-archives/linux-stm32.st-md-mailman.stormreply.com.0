Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI1zOPmUy2nMJAYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 11:33:45 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F7B367226
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 11:33:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED759C8F290;
	Tue, 31 Mar 2026 09:33:44 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D1C1C8F287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 09:33:42 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62V6xuni2164264
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 31 Mar 2026 09:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qbr1GARxBMsoXWwR9sIPZisrIlDf6DQwHv9fzbstqNI=; b=gYURW5u8Oy+FvkAV
 iV6lj1t2gyDq2TyCPN5xPmOqrKfh4g0cVxLnBL5w+fuLUXgFDkIRmo8Fn7AtGe5X
 WgpJooLelIuKRBFqZiousuqAhqvLT2s6ikMh85ii3ZTPCU3FUMQR7rfD4ux+ddzL
 uDG6jMUe5ZOXx1Lw+KHM/fucy2cUv/jWn9fuuhnd3yRLRqRgOJ3A6t7OBHUIRD0t
 inlW3BVWBqMTRUUD/7g8L6YP/JzGRmB4wTgPV4jBcTHx6JdbnyEqgl2FUC1f3kJU
 xBPOJaHKh6mcscOX+CYbIQRHFx0lPaTVAr7dgtBxP/P7N4kQXFkCeklGBjhyorUv
 iWQo9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ga0ntf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 09:33:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cfe29579d5so212088585a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 02:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774949620; x=1775554420;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qbr1GARxBMsoXWwR9sIPZisrIlDf6DQwHv9fzbstqNI=;
 b=CR+bbttx7Y10HTUve8sdpgRsxhSjb37umRgjpBNZK8L3HhHZr0zivsMvlanP9fvUSN
 OWstOn4YPp83Gdn/IrZot8j2hW+oC6hMkMSFna4k8eLAr+F85AaoIHIkVV4flGm87cyV
 3a7W1fw8sHk0rTnvJBzcOG0clxPvYQDc1YumKNk0fFEv85E7iuMOdchvaO9XSTAbw7yU
 6ujqsL/XNHkMHNeEPSdjmWJfhRdGLSy7I6TypTfV7QyO5sIpnJdd9oUsCxI7p9nUtakl
 E8To/igsDavmWhsF52XXCcM9Ck5jU4QfAueRN5I+oeuDEb3DkptvD8TC6hDr2iHXmCOT
 xoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774949620; x=1775554420;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qbr1GARxBMsoXWwR9sIPZisrIlDf6DQwHv9fzbstqNI=;
 b=TUyOkkHSOny2paR9vT4aAEl4FIUNhG6frBpGnFzfQGfPY0GYJ3uujfTnBJVuMjCeo6
 /D/JJhT/ON3MtufNPOYdyG9QtgPaSE9dUfK2x0wthP672XVHCa7xU8Ss/073rpwIEdMl
 YdUJFxNsG0RBt+i5QLPaJLECpHROQu6eANBPHyonRo8yGHHB+YVIHbTSLPryqe+ql66M
 8SsRSI0t2PLVeQjBh3tGRj4GdKOIWH/WesEN8uuYd1pNk9LMZu7+bHFOd8A7cvAl5y06
 4Xi2avq77CgGGWh1ouQK5JMvjoFeGfJINtf1F3VQx2PBntnnR6e5igvuqPJ4my7UMGax
 P+pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6vNeb1YcUP3erES92kD+sY8ESfORJDh4xpY8ww1Q36aw3p3FfinSWlPsgSnXkGYTGK2yFVOqLcO2eZQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxOf/czORaT6PIn3ZquYLtRNbJfcTlrisqJv+hS84NjFRkd5x+E
 fhJAd32H5d8DEqmpEWjZhL/y00MYgvK6rrPB6Ap1ICpXiBPzi20azfZGufiWXEmrS8NPXfEcCfp
 Rft4D8D7xpvmD8fxPX5XJknmJ30heJUX+evGoMuj6QW+nD3ATKro6EooiRaU5H2VA50IHNqwHy/
 ELJ34ck5Y=
X-Gm-Gg: ATEYQzwUczL2LVYSH86q8d5LdLMes19HhWutrsMGFX+0nmuxpLAF+3GprwBR11j6oTL
 ngcjlU9LP32vKEmjTNC9xHlliO0LXNv0snF1omhgQeDqksdc30irBWp0p4N5/9kLED+Yj4M1ydM
 Mn2UYb44EQZMSeedDWNALO1uR6eJssN5ePThsGW9Ria+YFUsT688q8pk1OmYHS5Wzx0MoyyCce1
 zI3M9A4S/eR57gOsDgYajvedQ3rVn57V4X1bJBvE5S2NbWnN7QjMrHKNqYX7E0r+UYQn5YPEp1I
 Kj387vXvB1yC6RNmDqpXqIh5Oi8cdyzxf0/kYuRuk6tYeWNsUARwGls6g2FTq2JhHd9002N+P29
 FBbL75tYa+cFfYue/iu9zwxHdxuO99m1oIsmJAJeOpIdZQBYzi63pZscLZTUI3luTXDpe+1sxis
 iT9LY=
X-Received: by 2002:a05:620a:4709:b0:8cf:d289:d0f3 with SMTP id
 af79cd13be357-8d01c7e1cf5mr1572459985a.4.1774949620382; 
 Tue, 31 Mar 2026 02:33:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4709:b0:8cf:d289:d0f3 with SMTP id
 af79cd13be357-8d01c7e1cf5mr1572457285a.4.1774949619932; 
 Tue, 31 Mar 2026 02:33:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66b72762eabsm3602840a12.4.2026.03.31.02.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 02:33:38 -0700 (PDT)
Message-ID: <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:33:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KJpXzVFo c=1 sm=1 tr=0 ts=69cb94f5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=n83Ni56Gs3YPKE9ALmUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: FNwcjmzlSkeUicEEqv0SdcWU3O5GoImB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5MSBTYWx0ZWRfX7xTs//+P8pL2
 /dDbv297Gc65DOG1/TfscWWR0/dgzFhdkVJ1+48hVrkHGF7ybSum3nGj8CT+qcpWVUKJEtmHIsK
 Dn8SyAAKyGhRShSDIrRGL9aI9ndWUezR4xTBXfTHY3ynDA2cb9S+jFDhKLtHUCxJqyhRqjFoHDm
 LJa5IGQ9UqtSsqZtrKg+hwvkgmMBOrgsQIpr0e03FM2N2GTiKIa9qrCH1zKLHAJhGRXr/NRoNph
 SJ6byxCzob3oD52m5Om+ZX7uONYcQjEQxnAOfnCAMUJ/TZN/Jx2fpaXplMVILaXIY/eJ7cKI1JW
 tY4JTzGxp/TRl70bsHk6Bssl9JDsE2LtJpb4Ef5jptZG/MIG+XdXWxZAw7MnUuZ0ITejJEsdn5x
 HnzBdKuJXYKMf/MPP4/owZHI71l1WFCGMZpjvdsStgz3WQPl0Y7S1Dm4j0CTXGbAFUcTVaAZwvC
 MCAHHpzN6c4/19GKqIQ==
X-Proofpoint-ORIG-GUID: FNwcjmzlSkeUicEEqv0SdcWU3O5GoImB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310091
Subject: Re: [Linux-stm32] [PATCH 1/2] clk: qcom: Constify
	qcom_cc_driver_data
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
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.910];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 82F7B367226
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' contains probe match-like data
> and is not modified: neither by the driver defining it nor by common.c
> code using it.
> 
> Make it const for code safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>  	size_t num_icc_hws;
>  	unsigned int icc_first_node_id;
>  	bool use_rpm;
> -	struct qcom_cc_driver_data *driver_data;
> +	const struct qcom_cc_driver_data *driver_data;

This can be a const ptr to const data, even

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
