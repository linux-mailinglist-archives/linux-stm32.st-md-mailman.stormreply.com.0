Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C15ACA29CB
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Dec 2025 08:14:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6213C5F1FD;
	Thu,  4 Dec 2025 07:14:27 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1F64C5F1FC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 07:14:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B468jTL551635
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 4 Dec 2025 07:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1nF7KRnXPuuP/bAwN9rvMlJ/NT7u6usEQMpt8zz2V+Y=; b=e+Phu7H9jZ2KiMcp
 2fxKKyJw0GVqKQFfutfDfVrDZFBrQJvfC5nc1Gqf+CVQ1NPUWYmv3Fr7SsT580OS
 nximFAtXy2KxXsoPv8q33pFrB6oX7i2waI+TWLjOqyKlg911DSJvvwr5A5EerBTD
 OvhIykmJtN880CNL++d6gW51957oBCg+6aD1wQ7+se5ffU0nWV9FMpbnfavUw1XW
 smZBVg3aPjX0ieU8ahJ0kIUKdg4Tj3c6NHnjekPcWRqu8B1ywR8vcAWo8k9JBcvD
 gPChlFBJIgrFq+Tbwdtq1UIGKkQ2483s1oiA2VXFtaHtxQKPkLCwm7aFng0dxQqk
 uvr2ng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmdb25w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Dec 2025 07:14:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34943cc3221so1038515a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Dec 2025 23:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764832464; x=1765437264;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1nF7KRnXPuuP/bAwN9rvMlJ/NT7u6usEQMpt8zz2V+Y=;
 b=kh+F6Fq5QHn60LCfx11iazGlXmW1h1guIjQ4wr4LWXKuMZxNQEJenmuf5vbL3WdxO5
 VfOWQnftmups1thp2tWNVJVC++Qwb15jW7idIGG2Se4syYFAKIC7SAmD80BNrckC26eI
 R4HR4/hlUAJ1rbQUrc8x1FkU95uiWr+OBkQQviNTRTrm6YAtjxi+G0yOvxJnkz33rDRr
 qE8c/i8AoZ1Do8SzCJ/zw0NH0CKbhdEKWxC8NsoITzjjtZ0ENrBA5P6LwykqVK0gnsl4
 1U/6OX/0PgmXlJgwnLvo89DnMTrOpPRzgLpp9F0gsdiLiT41vxhjjz2sxYZKce9V+0VF
 dYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764832464; x=1765437264;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1nF7KRnXPuuP/bAwN9rvMlJ/NT7u6usEQMpt8zz2V+Y=;
 b=sxqF9W79XupYt2eobqMlVF45bCEwNd5LsljoVxq9xiSLNS9LPJ8FwWTjFQ6R1daLHL
 V1DLqkPSYVf3jo4ajndjlV2rN1aFBbhwg0x0IshPcjjzRkwymq+i3eHp5/c6OxLwTWBB
 PXfwTtP3wG4G10hDEV/P2AkOTOg0kOc8iruNgb57BdFc0HoMoEQs6OdMK5M7aWJ1Wqv8
 Pz6HkVO9E9foJ9WuWfo9zZ6hOPxeJ8fhoNOzKin5xEfPJeV84l6nxl+aDr4SV6kwbm5u
 W8SzTUekEBmyOGAZHBt7F0D/Cr9tJRGi6BgrDioL+8t3AeMzVpouqGOK/g0g8QsKtIbR
 V5hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU11KuZY6+phvFt3sWXKkh8yAt5BE9sswAp/umDKgSqrRzFZAYcC86j6rS5iGJQTVChUHtNw6GBIl4TvQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxfDyxWlP4IsK5MAf7tQMySrUot2WiAJkIfUkv7X7OuNdc48o0z
 Zgxt+Wl25GGqvPN8OgJ83PEyKKW2ZbKNnxZMLx1jAvSQ9n5FMh7KZcOhe3oDKI4WxN8BSMrxZ0q
 36ZjaCcBevaRDoEyOSyRdQrrsU7/VN6R6WHpgQueuDm9rJGbrPGEnOltnIoSeTMaR0Ij7z1mkHG
 xpdWbEMqA=
X-Gm-Gg: ASbGncugiYQEMbcJ9Fm9KzsI/swKEF7N2Dn+UuS5RxmvzJwj8qz1Djk0SwheADH1OvZ
 oCkRQRirbnNdu22Mb4eUbhUDo258v1Z2J+s4Geln9UhoXn4oj8t9Hb0lfKF0tODCKMbzNbLhwTn
 1eqpR2JVhiaj0K/gkj5dSwEGnX2G5IoA1wQ9cwwueKMdhmL+aHUA1O+9RQU2RHJkFWsQazbgEru
 qKWHg62XBHZL0sOvLAlGgTO+I/RKzp1Nkj0Zx18HUZYWVVmzyd71NZgOZHQVPNKEMquIVbUxB9P
 W43TyfrMdDa+hNdxPLyT7s9ElhAEaVdnp1q5oN4gKGf9baud6zjmw4g3IYd8zaRLUyBpKljpAc9
 I7FJZUgatY2/QJHpLzb1KFK53ezAiGQRX/ft4cQ==
X-Received: by 2002:a17:90b:534e:b0:32b:9750:10e4 with SMTP id
 98e67ed59e1d1-349126f0736mr5893466a91.27.1764832464461; 
 Wed, 03 Dec 2025 23:14:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMj8ey2LgMUls5vb/bDVMguHBOIr4pbhmoevWwLaJZ3BPPsbZLE6wlw8i1niGvDyiNmkNTEQ==
X-Received: by 2002:a17:90b:534e:b0:32b:9750:10e4 with SMTP id
 98e67ed59e1d1-349126f0736mr5893429a91.27.1764832463957; 
 Wed, 03 Dec 2025 23:14:23 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494f398fa5sm889313a91.8.2025.12.03.23.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 23:14:23 -0800 (PST)
Message-ID: <75e53a37-0fd2-41d6-92bc-fb4ad5856829@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 12:44:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
 <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
 <8d0ec7fc-6eb0-4b71-8e0f-3deaf1f489d6@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <8d0ec7fc-6eb0-4b71-8e0f-3deaf1f489d6@oss.qualcomm.com>
X-Proofpoint-GUID: 1xZPDYtx-7yKoWfLLsdfTj9azwIzHnX9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1NyBTYWx0ZWRfX4pbFCnuPBetN
 u9Z11MBy8ZeSQephVPmxO8vjW7/8l7f0rQPRwngD4KdXEwe5VD6wotIspTDjK/FIYcBS6fEV7/M
 Wg075RFsjQgdoba9YjhVLbb1e5vQKgxJAnpO7tQBoow2Md4PIDgw/fPPAYQSaE6cAMD3Mp5pMLi
 0sKyhz/lJ0HTFH+PyrPAkLTD5+yvFs/mYVeiKfdmmlaNSilwHTRMVaYlmGbgqwFRmxwu+Ylt0ZZ
 gE8uZ0YS5VfazwfBQqZcGd0tEBeU75jbc0WjCBnCuCyabHstS8fSuMx0Jkocsscub/AIFaNAK9t
 jcOUBqFfnPI5ZoPVvkrl4USyy8GXIf+mjbv0hCy5f7oEqb2IJAYcIOFN5AwD12Pmiz/stRaTpM8
 IRgHJ9MfsRubBNz5+1mF+o0y22hrpw==
X-Proofpoint-ORIG-GUID: 1xZPDYtx-7yKoWfLLsdfTj9azwIzHnX9
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=693134d1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JxPSEc7MvJ4Lh0wbHXUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040057
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [Linux-stm32] [PATCH v2 08/11] clk: qcom: dispcc: Add support
 for display clock controller Kaanapali
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



On 12/1/2025 6:50 PM, Konrad Dybcio wrote:
> On 11/26/25 1:09 AM, Dmitry Baryshkov wrote:
>> On Tue, Nov 25, 2025 at 11:15:17PM +0530, Taniya Das wrote:
>>> Support the clock controller driver for Kaanapali to enable display SW to
>>> be able to control the clocks.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
> 
> [...]
> 
>>> +/* 257.142858 MHz Configuration */
>>
>> This is a bit strange frequency for the boot config.

The lowest PLL configuration is used as boot config based on the
MDP_CLK_SRC clock requirement. The PLLs on Kaanapali can support these
lower frequencies as well.


> The frequency map lists this odd cookie as the lowest predefined config,
> perhaps it was pulled from there.
> 

Correct Konrad.

> More interestingly, the only consumer of this PLL (MDP_CLK_SRC) makes no
> effort to use the m/n/d registers, instead relying on the PLL to re-clock
> for its ratesetting with a fixed divider of 3 (and div1 @ XO rate).
> 

The m/n is not preferred in the cases where the PLL needs to slew to
derive a new VCO frequency. That is the reason to keep the divider
constant as much as possible to derive a particular frequency.

> 257.142858 * 3 = 771.428574 over-drives MDP_CLK_SRC, FWIW.
> 

The lowest frequency requirement is 85.7MHz and the frequency is derived
using
257.142858 (PLL VCO) / 3 (RCG Div) = 85.714286 MHz

there is no over-drive at RCG of MDP.

> Taniya, we've seen something like this in camera too. Is there a reason
> the frequency is being set this way?
> 

We start with the lowest frequency to configure the PLL and frequency
requirements are decided based on usecases.

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
