Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vFlaOC//u2murAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:50:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 254A22CC335
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:50:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1D26C87ED2;
	Thu, 19 Mar 2026 13:50:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93749C87ECE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:50:36 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62J74CAd2884423
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 19 Mar 2026 13:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yGnqwVoeYcW8W8OE5dLl7cCg9GnEoBMh2C6juWu7YIw=; b=IuI2TldGbTeO1qOd
 T0bsZ0Ejm+yCkLIXovag4tC8Q1EfpPq9+7qsvWduPeuvyV36vJycPA9eFUhm5uac
 eman+oQZZDmIKxadtUgNxvMVDX30gUMjkuFPwbgPbHjUyfUdAiByfKGanto/cz+I
 sKpwiggt90ElyijYFMQAT7JHsitnAEBEJGzXUOFq0vxVK06Z2eAnmMj7YqyiKOhz
 H7S18hC7MEDHuHqer12XHZWkMGLcw80UNrdRn6BgA4GsGq4KyA0dWsLVUlwpyAXQ
 +2gjnWc7r/WUtCxURQ+263VxqdNgPGpa6spJSdtfadrbGSvJk49OWUIWqAW+vR3t
 GFAkPw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyvmym-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:50:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50b27636835so7505411cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 06:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773928233; x=1774533033;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yGnqwVoeYcW8W8OE5dLl7cCg9GnEoBMh2C6juWu7YIw=;
 b=DeaaU5kuVFPoUKKJYWyAWljCj3C3IC9F98Kiz96l0vh+rkMz/FzhFcLrzKkPncE8tR
 Fej9LC6dIdxEDwVa7HfjWG+uUFAoCcMr/Gfut3OzlAWYbyLGjSfYFDnwid+7uQ40Coyz
 YJyNEtE4RzU+4bwnpyAyJRM5YXLw43XDBBrgDI83zblp207ZuF+VpnT5K2KXhLfiC3xh
 Ja2cO0cM+va/cSL5JEZ9rJmCYmXuXJLC6BVIZFb3Gq5tVYbQ7SF9t5ok2HClmuoaLlyV
 OuiI7o936ZF8eXvwiEz8eOGmEw8hvoRI2+j7fGPFWaGWw8JI3pTqMBuHJbtAWcoF+dDZ
 X6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773928233; x=1774533033;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yGnqwVoeYcW8W8OE5dLl7cCg9GnEoBMh2C6juWu7YIw=;
 b=HIMFpEuQ8B6qFC3HZh/9VkZqEiU+w8pxHhKfPjJQJs6YwzgZYeONPzsslAR7Y78bZI
 8HXxDkW3MgcVkS2XhiXbUN2aZGWdWvL4w81hprGweE0EWs7yTgTEaH+D/KSQzmDt4upN
 6kIe2rFScpq+2L8RMYCtL7I4z8Ex359v69xVatmTk8i0KIFQx8H3To5yas+P7XWodRSg
 bzq+pj36d9layiFKaKZn0aFvy8VNL8Gid9XNjqTtckt2vp0TJHNTYpsMCtNZ0+Y62iHP
 FOyakMebaVyWHe4VvqED6IzITxhmGIBJ4WfZJDxvDm+XfE3plqvSKCEO4hxa6xcBAAdz
 1o2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZi+QKxRTvRXxZWL7PLcYPP/weuW55xD4+QXluUAynl4FcK8Oo9DBGnSRTkf2nYe+2XIzZdPLDRevukA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw+Q1gYpJGq3M8y6uTP50nl9xJYU4M8bvp1gwnbDGPjk6zWm5vd
 NlZD6+oTK7KwakHNyhpAGj2cWXr4Pcpq9blASNEq2oasnxsNUIWlu8q0WoNQpj3CI2gXn1XCIbI
 CY+gpGE/e0Bw71ZZto9WfDrpuhXanCoiZIE94Fnf04IgOnCRcohg/0tKPi+vTvowYX8ib0szsfk
 4kMW/O/zY=
X-Gm-Gg: ATEYQzxOXP/BgYVAFt6KKrRVNohM3a1FTKK9+JxYsgk6NrpEalxfYz0PC8iU3DT10XN
 aeBsBjIqc1wnjHS3iN6tuBCgNfaHzsjDJibL281qRdiwIExpRKfMHLzwEOWhifKCrat5+f0C1Ja
 fd1hJpityNMr+Je2E6J1xWAxUrHYe/fsm5yoEsuKCoGsyYKgkcjKgLRfh/lEbZ34ORfelwVctm6
 S1HeQWjtAopPfVN3nOWMzOxckGNzof5aP6Qr116vTRAgF7ANoIV/RTUUueNAuONYGapcGQ9Vfve
 dDoz9w8VNk4cgxwlAq1jvhT5oerU5AhTC/M6c+OF+XDUNiQzVZjMwduxnuZYDi+bVqQCjy6dcnJ
 Zw4YZeM9V6vxv99nEev8/37A3w0XXhi9P3ZE5x+4pNXageGqo9vwOEtsRhYR3+YlJS39D1iOU9C
 qCWuI=
X-Received: by 2002:ac8:5f4e:0:b0:501:4767:a6f with SMTP id
 d75a77b69052e-50b1478e819mr78290991cf.3.1773928233460; 
 Thu, 19 Mar 2026 06:50:33 -0700 (PDT)
X-Received: by 2002:ac8:5f4e:0:b0:501:4767:a6f with SMTP id
 d75a77b69052e-50b1478e819mr78290561cf.3.1773928232827; 
 Thu, 19 Mar 2026 06:50:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b97f144e53bsm462429666b.25.2026.03.19.06.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 06:50:32 -0700 (PDT)
Message-ID: <bcab38a5-e7f7-47c9-ab9c-99294e095c22@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 14:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com> <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk> <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
 <abtE7sDT75I7uPnk@shell.armlinux.org.uk>
 <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
 <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
 <abvy6nZyjyxUXMuf@shell.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <abvy6nZyjyxUXMuf@shell.armlinux.org.uk>
X-Proofpoint-GUID: D8Tt-kWUmllaJQw49pjI13Xp40R5uHkZ
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bbff2a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=WgXOwRHnL7ZWy7TE_9QA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEwOSBTYWx0ZWRfX2RbqyI/kKjUe
 o56BqZjFKvhXjEh6CUWS0nKgq2f+o28obHRmBfZ8kd2tiIzBT2pymMy2rdxKUZ9NnQNUbXjFE5b
 5QZkG2lGnIGndQIcPkaLH3svbGVpFTbWgYqw7P1pF0I/91iP+p28UMpOgr5+/P13jUY7P3nZa9E
 ducurrIc6PSt5PnJELyEbC3MGi/V6wn+MxaYJaSE+Pg1BUMCVcJc33EdQjqFO8kwxMwM2D/PNxz
 /sG5YNLhz097iBWhLfqk2An7bryW4kaj0YbdfwAGw9tszXZYzRQlrsHjTdnjG07x9Ej1BbcoBUn
 F5jhdKkvsNhOCSLFbJ29Q/wmW1PT1TPDFwiE4/WzSGaZaVWV2RWk+tWojV9CsQ9klYn3M8ckM4C
 3NYbsmsyMVA+UaAbviCz6q9eyb67RfEu4zMvtqqjq1eb/Vv61adCPTsAkTMgDQzssB7YavVucE9
 O4TZPPqrno95ToDCkcg==
X-Proofpoint-ORIG-GUID: D8Tt-kWUmllaJQw49pjI13Xp40R5uHkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190109
Cc: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/8] net: stmmac: improve PCS
	support
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.838];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 254A22CC335
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 1:58 PM, Russell King (Oracle) wrote:
> On Thu, Mar 19, 2026 at 11:09:33AM +0100, Konrad Dybcio wrote:
>> On 3/19/26 10:24 AM, Russell King (Oracle) wrote:
>>> On Thu, Mar 19, 2026 at 12:35:58AM +0000, Russell King (Oracle) wrote:
>>>> On Thu, Mar 19, 2026 at 03:42:05AM +0530, Mohd Ayaan Anwar wrote:
>>>>> [    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
>>>>
>>>> Please look into this first - with the MDIO bus operating at
>>>> who-knows-what frequency, this could make reading from the PHY
>>>> unreliable.
>>>
>>> My guess is clk_get_rate(priv->plat->stmmac_clk) is returning zero,
>>> which means we don't know the rate of the CSR clock.
>>>
>>> From what I can see in drivers/clk/qcom/gcc-qcs404.c and
>>> drivers/clk/qcom/gcc-sdx55.c, this looks like this case - the
>>> struct clk_branch makes no mention of any clock rate, nor does it
>>> have any parent. From what I can see, neither of these drivers
>>> specify any rates for any of their clocks, which likely means that
>>> clk_get_rate() will be zero for all of them.
>>>
>>> Sadly, when I designed the clk API, I didn't think that people would
>>> be stupid enough not to implement the API properly, more fool me.
>>>
>>> Under the old code, we would've used STMMAC_CSR_20_35M, which means
>>> we're assuming that the CSR clock is between 20 and 35MHz, even
>>> though the value is zero. Is that the case? If it's higher than
>>> 35MHz, then you've been operating the MDIO bus out of IEEE 802.3
>>> specification, which can make PHY access unrealible.
>>>
>>> In any case, please fix your clock drivers.
>>
>> I'm not 100% sure the currently-passed AXI clock is what we want
>> there and the docs aren't super helpful.. is there a synopsys-name
>> for it? What rates would you expect it to run at?
> 
> There is no easy answer to that - it depends on the bus interfaces
> and whether the CSR (register) clock is separate.
> 
> The likely possible names are hclk_i (for AHB master), aclk_i (for
> AXI master), or clk_csr_i.
> 
> It does state that the CSR clock should have a minimum frequency of
> 25MHz to allow all statistics to be properly collected.
> 
> The rate of the CSR clock needs to be known, as selecting the divider
> for generating MDC within IEEE 802.3 specifications is rather
> fundamental. You may find something there which hints at what rate
> the dwmac's CSR clock runs at.

If it's either AXI or AHB, in both cases their direct parent is controlled
by an entity external to Linux and their rates may change at runtime,
based on aggregated needs of the bus. They're defined as levels/corners
(abstract term for a hidden volt+freq combo).

It may be that the operating range for the EMAC removes that variability,
but with no concrete evidence and just anecdotal experience, that's only
the case for the AHB clock

Hopefully Mohd knows more 

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
