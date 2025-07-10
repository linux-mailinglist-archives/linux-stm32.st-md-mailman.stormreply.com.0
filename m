Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D89E6B00831
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 18:09:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F118C349C2;
	Thu, 10 Jul 2025 16:09:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06C8CC349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 16:09:18 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A8mLb5016794
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 10 Jul 2025 16:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +vQ+6ordS2MREHUlH+sOv1F4IpVKnvygDpjQPI9SC08=; b=CmTGLJWINImAHKoL
 C3DmEyyOHxwXFEHYDYwh9nNs9+qHt9oDnwlEHteC1OnCI6yisLYB4/ucmnYvvLrj
 9Gnq6RF4WjuDnhLew1VVzZh/snqX6sLbsFTDtDT88C0KSOr4Jr9wcZPL9Eg85AL0
 Kx45dAtjgRyOnaoGdJSd7P5kZQCjABqt56jZujpaGtfIVeGs0RuMBAUfcJSAXwyS
 vz75sSrZHISd4DCZLQUP/EVxIiXZYB3tRoFHAQTFkBZMnonxyXEwXKUUMo0Yke+A
 gy9X7lG2p3TUYGL40TOiN0KoHtT2U+B6nJ8XwMK+HwSgGGmHgEC7eAMpNCw7vVSq
 VAOVAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbnwkht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 16:09:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d21080c26fso18556085a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 09:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752163756; x=1752768556;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+vQ+6ordS2MREHUlH+sOv1F4IpVKnvygDpjQPI9SC08=;
 b=ltrY0WdqqobuJmBmSmsSwaf+6Zkt8LyrljDNuAYVblSFaArzaX+wLirPMh7JPb9KOX
 MZMN4EECbWQlUcYZWR6onjvlLWHEmro4OXi5oBtvXcucbOHaDXFXwMhqXVNXpz8dJ+ta
 S9igqziwqXy/VxDIzavFh4izikBA0l0e/MjHsegcGQS0Vs0Dw2HpwurpviRZS0QLAO4/
 wmeoa3JO7OtNa7nR5TMQozPxa9Qvet8u1lZG/0fD8G+305hUOzhbpSfYJRqub1AuxyHn
 4Dk65RSdA/sO7g6lUKV/UyqXQ8aHvGk24FfDW887iVJlE+Ls8pgPc2DQ6CZ1H+e7IkOk
 e39Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpCWbidXqx3cpJ5ayQ9psVVJsyAZ4LdMI5GEI1VcgIWuyvoqFQYiz76eGp9VCSVtbOgHhUJFJATA8ogw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwODjltLQoVbcXrjZjZ7KGIIDgWhuodsx8VZMcoY0pyHRETBFpU
 i32jrCqZ8mIJnznfL+BGCsUXwjBYCRYUklsfTQ1ouH0ebK7PkXHLN4U3vF4GZnmfC0CTCFiUyoR
 da+SGNOaS7puhwQfjNGaygK9MkfCCFP8KapU1gqxafUif51JuDFPw/EcPQeIn0kFFr+mGunIgqf
 mIJp/0Q3o=
X-Gm-Gg: ASbGnctS1MG+0kYIgu2dkXICAgtoez20IUBrrh/dHFTxxcjPPBItlKnOvUSSIcM7BnN
 xm3rtqE/FbxUxTYspFBaz+g4wXLPZ9SGSyFav6g1fQndTvodftd/t43qVTPFu22ECmmkCnas8p0
 ix+OMDAXFKgOHiZ1ihvnpkWQSpjIYDoKIlkAa/Gm8aOUuQJmEbX/Xcr/HOERDhQ6rAM1H2lQWjb
 E9Uq99TzD2+yKqLw9tbz/iX2b4Sk1K5PHbJZpW88yk5mBSJIY8N3UW1/Iw4JEKWqYmJ6/M/vQDR
 LC6UxaE+b7ZlD1a2ymVnyGt8kkqV6k0S+FNEq97DSr4HjMV9gCCxc5BXXuRQ8NPAbbvyN76Rf2o
 4MoQ=
X-Received: by 2002:a05:620a:4726:b0:7d9:d722:7678 with SMTP id
 af79cd13be357-7dde82dd8e5mr7300085a.0.1752163755572; 
 Thu, 10 Jul 2025 09:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAeeRzlvLfbUeyU2SSOBFEfwuLO+KS9f2E54G98Fl8PmYU4woiYSJtTIHX8QfSQxlGnb4YxQ==
X-Received: by 2002:a05:620a:4726:b0:7d9:d722:7678 with SMTP id
 af79cd13be357-7dde82dd8e5mr7279685a.0.1752163750275; 
 Thu, 10 Jul 2025 09:09:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e91d10sm153830666b.5.2025.07.10.09.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 09:09:09 -0700 (PDT)
Message-ID: <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 18:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brian Masney <bmasney@redhat.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
 <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEzNyBTYWx0ZWRfXzNSkCo1NYy5r
 l8onQpFi+cp9iunpXJQxta1QhoZnvVdDVEvU45ub58OiCZbo9hIuOq26nr+F1A6wn0cF6uR3GFY
 ulbVTbFDDLiZ7v2Rk9kTy8ajGnfkWoom1zzLuZwIJkXzxqh6eBLzpaHMxhkTmN0N2fMtoNiZ43q
 wAZqNxqh/gRy5Ze2fknUvHZcBqTxWLH5DgtZPoKV/FQwh4zOHJlmba+An0Q7sfNMWPxxaDvaYnv
 lDGGFx8eEfyxpbgYSJWsIFuPEpz2L+Y2DAz1gW1LGg1OWQPo0QmdYTEzFRjcdOpq8acodKYgzSF
 NCWSmwGf0HhJOzBin13cY4AR523MX9O8velEK591QhlHLJ9Rzw5sL5ruv+uc0szcek+dNLrsbpi
 PdysLQAFVeBHRgssQEr6K+Ox++T+oxVjCodZ9pwZEO11U0Pgglymwpnmj1T+HVXYxGB9cvx3
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=686fe5ad cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=RGHBBWgGYxkf0F71jXEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: p4U3hxoWwEPS06xaI8w17_WbF54H0ts2
X-Proofpoint-GUID: p4U3hxoWwEPS06xaI8w17_WbF54H0ts2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=742 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100137
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/6] sound: soc: qcom: qdsp6:
 q6dsp-lpass-clocks: convert from round_rate() to determine_rate()
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

On 7/10/25 5:51 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

come to think of it, there are a lot of drivers that can not
do any rate rounding - perhaps we could introduce a NOP implementation
in the clk core that we could reference, instead of copypasting
int foo(...) { "return 0" }?

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
