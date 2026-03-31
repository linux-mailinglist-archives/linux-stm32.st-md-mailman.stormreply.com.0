Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDgEC1Ciy2lcJwYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:30:40 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B098C367FDF
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:30:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 456A0C8F287;
	Tue, 31 Mar 2026 10:30:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 113CEC58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:30:37 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62V912Pw2761342
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 31 Mar 2026 10:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3nIEzeVfwHjMoG7ArZioQyE39YEa3izl6iZRYRduoTg=; b=KdVnZsdRtnR2gq7T
 lcelVAhTrgIH/shudawtLTooth+u06vUOSKHPaVWN7joo65ZrsQGXBO3xviSME5e
 OiGaJZwZ4BF8NJAS33zImqWlP6Blr5Z/CIEyF6vatsJsQ9wCAyQRb1eH3X6WRXO9
 bfQO7pGC0T7RhPCTgkjv9HTFg3D4FXPvw8tI4Qsb1+QJtTaoKD5y9AejZ8r2Uuzr
 Gdbseg2PE5aUXJ1wpfBSLR33U7dvFADz8kpkvlTGAeHq5U6feJQjCYB0GNvWX5O8
 rQLJ0Asv5QbDCjiysclgTbZk4PNe5ymtq+cZGzQbHqHq3gO0anNOvyhvvikjux6t
 UKOqHA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b930cc9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:30:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-89f59c9bd28so8056516d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 03:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774953035; x=1775557835;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3nIEzeVfwHjMoG7ArZioQyE39YEa3izl6iZRYRduoTg=;
 b=VHmI80mLEkiVfZFP8Xpq8g3ug5XvsO6BSUkZsZ5rz4emGh9U3gcJV/xtcAX1uEDTrQ
 EPlm/+hU4DZgXW3Q4MoVGtDn2XOJ2m+NiY+Fp3SYrv5HWzwBVzIWxOwSQGCj0au3r7cx
 rEJLXtfXAQhYgmJvXChsaAjxhR9NBzN6o1Pvocgw3cK5EpRK0Ifl+3NNTE3Rz4TA/No6
 ChOfVE3I1iyNG6auA1y8OPokZ8lKX0Q/pJxuY1RUcCAsAL7UEgEg25sSm1hRcf3RQIde
 7f0tOPwpLH7H6Es4wiJ0TyCxHSGyFlHVx6g92LH8CP5npdWy38xdjG5/H5qEgF+ecDrY
 J2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774953035; x=1775557835;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3nIEzeVfwHjMoG7ArZioQyE39YEa3izl6iZRYRduoTg=;
 b=b+wQkR2j74Ry5OvV7N3VKlnkUXwMGw3xZMr2O5mwGQGIajU5pvOSbKZx7RvqdwHSTf
 KqVOQUnCkhBbDwWkZpHfpAFDgRvUyzsnNG4uRIwEXYyB0w9AqxuMotonKLSCfoZtOTnF
 SqIew3hC8JM3vB0pooPJhWwBGbTfDiTT0u2CYLob4tjsLMroQqhuHc7+enQQIquuCaBD
 tHDHoEFmKKwd73wUxDIjM9rMu6/yEiDN0mzCzvcpsrO2trRm2nEaiFxfqUZBmGMsLQvi
 trYuaaQECaXjd8cpalwHv/GFCmoHgvg2F+2EsRstv/YxbOd3D/zUx5QgSJZfthOmxLSI
 IXyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1CCHxs+XTzQp9IEutXDDXo7B0PsOYazP5YbZEL6S67TQBqn7KGW/CkEeL5YoCrE2NliumuGjnA3AMtg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzMezjjvzE23DC1a1F2rSx9ELUyqRuJCRdMFvaa6blrzmqfxGCi
 eYGDwMalnayFBn+4kW4Vhl+gvR6oeySi1X7yW1YrnwavcHffgxEAMSXpwGe6rWdRdc545emMKde
 Rhyg3ADHR4+wNrmoBDOqLOIkEizLNEdlf9Bu8eCJ6ki3IzXg7zOIfnQAbmFRn3FNMnM8u6asUvc
 u/Lz0GjUQ=
X-Gm-Gg: ATEYQzwbznnKZxCToEwf1vAYooA6BUfuqbWXRTzu1mOOe9SF1K43e9YbSRUyzQyH56n
 tter/9SuJ7KyqsQM1iqJN+eGa8pyLhZE7FKC63MyEq04HWthjSfjcRDWYmTiJP40sKf1FRdUy4W
 3/kNqIQY6WGaIOhTJQzQJsSUGK8nHqhT/AoBbhxBOhmILfJHWr1jQ8Q34HaYyusJH0aC7R2TkXp
 1nlV/nMRVrA1forYuwMwtRp/i1wDaBL7Ntk6fDPXe2jPQZnK96ryiHJxY8RaEiFb3akr8pc61i7
 pLn3DuRdkixtuz0IlAWBxggUPZELLHPnGMCWNfrA+QwK+Iwxs6AZJEzfIhdbn/0pcgyXU/Vgvv5
 sLk9QM5ha7QWN31GVaZ+tk26Ml2tP7kVWVZyH1R8Zgpxn/9aWBQR+cojG+4h/W34+
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id
 6a1803df08f44-89ce8e27f81mr178613696d6.5.1774953035255; 
 Tue, 31 Mar 2026 03:30:35 -0700 (PDT)
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id
 6a1803df08f44-89ce8e27f81mr178613206d6.5.1774953034772; 
 Tue, 31 Mar 2026 03:30:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9b7b1dda44sm385697166b.43.2026.03.31.03.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 03:30:33 -0700 (PDT)
Message-ID: <2a444667-b3f5-4992-aabc-6e7bb1b1cff8@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:30:31 +0200
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
 <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwMSBTYWx0ZWRfX8pUmE0Ehw0JN
 UJzmGDE1hZJ3ahoAmcFKAlSNxIJ7F7XSVGlAmRfK8f6IjP8OzjnPko3mzuOdSMIvynA/IMXQ3W3
 7Hhqw3kR+lITYPZegFt+H9E2RdDlnWmhnZ2tU/I3qCTaLbDFEMDJ3wNXP6P8kjCa5AySk1cLZ2y
 xCTvvdq0uAURTSqnyi4LTVApwZ3LS/otZe1lRzsGGhDDfR/L69+8wxBG5pAGKl+DWLOJRJK4Pdw
 2W4dQ4t190gqLfJ5s/zARWJHvFfbGBlOK9L0x5RJ5Wlngz1qOAKa2rmpyKc5p5/BSz8I5Yz1DI9
 eYgWCungwC/qU6k0Ub17JpgH0yoXKTGNi62AKuBWapsvDSpOnyvEuD9Ntw6QItH2AxfHGpoYygm
 uY+nyx2ZnivEl+nW0B9M8brNwncIkpbUdrMxXH4CiSEHDa2SvKbvC+7CbirdsigFHxJ5GP4M6zW
 GkbNIac/m1sfPIgwMAA==
X-Proofpoint-ORIG-GUID: 9XOlSfWDXMxMwZkZWzkxf0VJfSEHu7-u
X-Proofpoint-GUID: 9XOlSfWDXMxMwZkZWzkxf0VJfSEHu7-u
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cba24c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Opsg_zMjOw_MMP9tyQsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310101
Subject: Re: [Linux-stm32] [PATCH 2/2] clk: qcom: Constify list of critical
	CBCR registers
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
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.910];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,stormreply.com:email,stormreply.com:url,qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: B098C367FDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
> The static array 'xxx_critical_cbcrs' contains probe match-like data and
> is not modified: neither by the driver defining it nor by common.c code
> using it.
> 
> Make it const for code safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
