Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEWKGNM9emlB4wEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 17:48:19 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDA7A621F
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 17:48:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E7EFC56612;
	Wed, 28 Jan 2026 16:48:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2D04C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 16:48:17 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60SFW14p3879174
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 28 Jan 2026 16:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NxpP64Jo3ISqOedMpw7nBc++9OWyKJZEeSyktb7Rxas=; b=VfBQTrRR71tT+QHJ
 ADITeT4Na/MRQ8jGTYFyk4wBz4qhQ1uPjOWFNfuIJc+1zybZ+LyxuA48b+LrayNg
 yfQFONJ/jTZYe86TeY938lhvW2Y9U2nZpGjDfQR9o0H6RH7kAG2neQUvm2GNDAot
 SRNYFTQXyn0iIoEFb1YcoGGqaDd+TEYtB1SDUU3O1JJAdMuw4EBfCatAoJJJNAiu
 k11tpG7lxBefCu0O6LqVvX9OTGh5a/zTr0pr22XajasEo3zJ5kBcjFKFIFxnRIdL
 3lljt1fadot5asEnnhqIODc8Z3n8oLDaRXNjozgNsCG5aNLs/y4hji4SxiSs9oDi
 j0OWxg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv2g1p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 16:48:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34e5a9de94bso13615065a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 08:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769618895; x=1770223695;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NxpP64Jo3ISqOedMpw7nBc++9OWyKJZEeSyktb7Rxas=;
 b=hFiTs6SZfdCWLdYFvqH3r7pRPFFlider9G0Wm7eqIN6DkdYUbIt3NJA7/tVRa0CEt7
 fXw1Grvs1eVDjWq25Vb1yLkWMfTJ5hqYRUFMd69CJ5GdKzwUNDQge3muNOtGTtoDfCwQ
 qNF3s1JdILn4Y3tH9jQ0VjXZcvojBnfBGX+qeeDtc8enj5B/BQsQnnDmSeoipvaVNKio
 vyNZNR1g9gDagl3re93IS1zqfZ8zsND80tYEXlRcJQ/EnREKGWDZV4NneuuQW2zjk89j
 89DrwFIupQSfxEyDWjczIKnrc6EdT6Wg630hTpinyh7S6PA5ru8VpCORypHdQ+KY7aoS
 lv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769618895; x=1770223695;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NxpP64Jo3ISqOedMpw7nBc++9OWyKJZEeSyktb7Rxas=;
 b=skEtPWjovs5zTh+kWMIjOY7+bmqxyz8dcMiM1N5QEtmj120U8I9eVh1Q9U0vxtIBem
 J5C1Tzqa1xlB2MhaVqkrWCU4LNtUqy0nySkLNUumYJ4xk1JNTeBE+bgCW1SAl6kcECqM
 MIf3stsEuC3FYpjv3LbbBo14rxp5wZVlmiVCxqfZc9O1pcWrBKGrhcHbPPiz9MNMTZ61
 It0dDwmJ9oIh5bcLnUR6xkUCjD0PjThwXUzY07Wml0XoefpZLMMhGo27EB/bWa52U+PO
 QLgDcrnwmIYxoQHeRdWC2DlVZ8psqaDOdqFmxoBE6HCA2uu9wXdK/f9sdrb2pwFPBPdA
 XBPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTSOQrd5BMJXWg28sMCA1kBspNW+dGw+lyxcsQ91xQoFqJu4Fppwi4rvqrVpcY5k5Wd8l31VtBfMcstQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwksU5BFDZO9Z2vXvoGwvFDp1R+++usY8mfFd+R6tfBPzqDappG
 08ef6Bls8BzQwUHSH0m8T6TkiYFWX9jPVLvwPP0oAqxer1xyCYz7LlQVGJSQjpsWI21nMqPQWN9
 PCmat+kIY9a+1tmeo5w+dShGHZ6regpPfA1FgYHmrHn8EzjHJah10JhVEfLP7luSPIuM/HxyWLB
 DZHhgE37U=
X-Gm-Gg: AZuq6aJZsmi6GYa/bxoSa8j1DTBzV9WqhRK78fEEZhHdNIPwH65ue+JifCRSYh+Ocn3
 CEO0KsIGcW5XHOiPQZ5KkbyZIcSalrB+V2xf2UXo7BI1o8AdxUSfCNG82DjiKUL7CcSkHipEgc3
 pddpfEpAh3DKhYJcs+upSt03FH59tcxREQAwiYNtKYcF4aUdxaBFyIDhCWPzOBAFdvXlCF6uO/u
 TqnwcJXQ1BBORp21+gINzrjAaqO/H+Pf2Mx1CrsgGkHmupZOV6aU3ebbs9H5VREPxKOZBXdVtIZ
 i8l9VMw8g+0u25f5C+G09SV9oWdW0T3459jEzuUWnCwh537IyfH2Za+350uHGp6R+WhbqP9y+Z0
 Bz31KIg5rDpoLiscGRbqg8WObxcWESj/v1E9YjA==
X-Received: by 2002:a17:90b:50c8:b0:340:b908:9665 with SMTP id
 98e67ed59e1d1-353fed94929mr5548598a91.37.1769618895108; 
 Wed, 28 Jan 2026 08:48:15 -0800 (PST)
X-Received: by 2002:a17:90b:50c8:b0:340:b908:9665 with SMTP id
 98e67ed59e1d1-353fed94929mr5548575a91.37.1769618894628; 
 Wed, 28 Jan 2026 08:48:14 -0800 (PST)
Received: from [192.168.0.195] ([49.204.27.196])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3540f3cc7c6sm2995577a91.10.2026.01.28.08.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 08:48:14 -0800 (PST)
Message-ID: <7d1fe730-1858-4250-93b3-81108fc4a0ff@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 22:18:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: hGprPsZsBDQDODcd1ieXEqHnLoX5PEu6
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=697a3dd0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=HFDkwTpxXVET2aFY52jhbw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LBVU2G7aICa-vlctToYA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzOCBTYWx0ZWRfX2tIXoiFxngro
 G2P6SwLZdgSCLrm3YC3EKCZyZ80phATf2RsWipkcOebwUirvGec3cOOaNtep7T8nW9sCMMD2cGO
 dbH5LzYkRcSwFV6aftkE0XI/7C6wNNr4SB8iaHTfwFAa+117bPBfNCGWCaKHKOniB+3OjWQb6B9
 JIIGVVmJIuP6cpTaoK0S5j4Ai3U0rOH0EQ6I226qnPoU2FGC1CF+GkkXiMK/12jwjq8xN/3+XjP
 Ob2rgzPSYud8PqLKk2Ulnm13t/E7FoZ835LukUZSdDkmmD2lKvRr9fL56oea1KJ6/g27SNkP3v8
 4Blr8LXdXuNyMw6s7YyLCZh9kaf7bPQaO3I90tTjZIoPIZJMNFPvTNUGIOVRM2EZGThbLEXl+Wf
 mzsuqUNPQ6A9giTOiZkBU9dP1YIrhBMIYT12hUxdJXhyRMzZqs/WgCIsgdZg3cippaDQ2lFtnj3
 +RIOuVDJUrPTuSg1wFg==
X-Proofpoint-ORIG-GUID: hGprPsZsBDQDODcd1ieXEqHnLoX5PEu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280138
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: EFDA7A621F
X-Rspamd-Action: no action


On 1/28/2026 9:13 PM, Krzysztof Kozlowski wrote:
> 'struct qcom_cc_desc' is passed to qcom_cc_map() and
> qcom_cc_really_probe() only as pointer to const, so make the memory
> const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/cambistmclkcc-sm8750.c | 2 +-
>  drivers/clk/qcom/camcc-sm8750.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
