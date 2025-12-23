Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E799CD8F1E
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Dec 2025 11:49:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D10DDC8F272;
	Tue, 23 Dec 2025 10:49:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8090C5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 10:49:31 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BN7xqSJ024545
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 23 Dec 2025 10:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JKBwHCYSbYIWW3G7Sc1xuSQXA6rM0/QQy4Vu6KzBCFU=; b=nKpwwWsYXt9o+EmG
 IA7MJ8Gd3B6ajW3VYsftGPmO+nYO+QEtc5iiIBa/65Yyfo51sUgG8viJCfcAKYo1
 GR2hFoJDaiw6+fYKs8qQJdoL/O6cmZE4k5pe4+kEsTLzEqQtgfQj+Ssylr6lyiaJ
 fW59z1Ivfe36POumGEA1kBg4vyeijX7JkFD67/I3C1f/HIUflCVF8SdHpusWVmki
 stQy9gIJ502yrmD24K4NoLh+zUQ1u0c4w6VyjO7BURtGu/gr1SudaL4TtUyQ7C9r
 Si9gn58U1vlPwaPNCRuzlbN3fbG0FJDOBXQX0e9NX8i58Jt0Yj/ylDwqKuDLOoPW
 Rbp7lw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhaaxj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 10:49:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7fc82eff4adso4758100b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 02:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766486969; x=1767091769;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JKBwHCYSbYIWW3G7Sc1xuSQXA6rM0/QQy4Vu6KzBCFU=;
 b=OYkKUiEVNFmk+et8d8VErrG4owusA9u5XNgJJkCWokMtp64PcwJAa4MROH7/fZoqKr
 mS6Qyk9ph0aexvSYr+nSaNYVv+vb+WFNZek2ugNzPNK30QuitQYlBOfeJke48QF5WvL0
 Et/g7AWox5XVQSmuPI7avHQihH6Nh4C4jmbqkK3oZfoV8WnF7OyYqYnyeStLvsnOwtlq
 NWOIfAIhb23Hgq4AZrHiYRXcyCbno0ESyb5m/je1wbzWjlD76Q0yVQX5FaflE9n1XfRz
 9bFadFcshLKbd12g3FpTyUcL5NEgFgp7NrTN0qE8aZYgDZVOMjP0gM3EGOZNmbvYLfcT
 RF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766486969; x=1767091769;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JKBwHCYSbYIWW3G7Sc1xuSQXA6rM0/QQy4Vu6KzBCFU=;
 b=RUk2f56I5WdrtckAVfq6ubZB6Z5oXk9Zvhhf2HP3Ms3RbHaLLRmoOq7NOBX+eiiWom
 4gnsv8rGxUsnOYRtNCka6c6wD3sdwMhKo/Xn+NCemw2W8J2mtgjVFZzYbWcLwLX8McEs
 9hMeRQ5o3MZILdffhvQHAQDLgBjDuMrQzIIVCVi/bFxdUe5terhRBW9+PQhFdD45I/mg
 tknTlWYdTwG/JohuD7s6ZEtSBET1qdqENjqg6hIgnxvBhAqrasz85Lt07eCj+tpRm/75
 FbMyfKw9P/5OPdllT6P/chT5PQhI4nzWtITL33e49Ye/odF+ucZ173UZ2d/Co7ftYvow
 NECQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgUYs2Pj8/IQGBJu4wC0tNKBoOekdjhVhxP7bjXZXpDw1Hr0hxgVYK8en/AbYgZih5OJN93F8AAjohiA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy723QiHpDmAEz67nfzJP19JnHtn6uGEKDg+hF5Yk76Iixx/lE+
 F0FrS8lt/WKsk6WR9qc2A6r+n6VQqg6tl1eGGUO3Ox+2f7WSyf8VBccRTltWaysumCGj2dcDa8Q
 7FBTDqwQMuRInK6M3xdUl73/6p/vtWRMsoDyCbpJ4Xj7R7DkjGWVTowvYIp950hERAzRiYiDPiV
 e1TlKDQVI=
X-Gm-Gg: AY/fxX79ZRpLto8ehzprr0DBBMC3K3QFKZZjRe+cS+lxBrHM1DT9JkxClSOaLRm+Ii/
 cSaSxgzSmV4UrMdqB3NY1KY9wnO2dpyoy9j4Cv86ruF+Cs+ieQZccE5bTZacY0rfNj7jNKzaNEy
 m7NNSgpn87M9vD/GXw1Vma9UZdSZGQeMRLPs/LfyHY2tlmZj1P0qT8wDywQGnP7mr3GGjqEFq+n
 cT4u7QRfcfFIvF4vVvDBwUitg46iILDyL9C0bgP1w0YYou4szn8g/OIogBA7VIpWrm45ru3jfQo
 u3wESgq9/vuMDbOdmHyQxo+ztXOZpj8MxTh5PyaPjjoVnxpJ//xhCdkahuSxPb7kEPGpnyCmcuS
 9016A8U2xeTciaxEsPh/bEXz3WQpy2OvDjpR4Yg==
X-Received: by 2002:a05:6a00:6b93:20b0:7b8:acdd:23c3 with SMTP id
 d2e1a72fcca58-7fe0c0fbefbmr11463450b3a.11.1766486969226; 
 Tue, 23 Dec 2025 02:49:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1v/1HacvwG7DWXzwiLrvcU2Zusz8BK/bUppipGd3g3H//7IAWFp+IVDMaldG9feohRs6Z6A==
X-Received: by 2002:a05:6a00:6b93:20b0:7b8:acdd:23c3 with SMTP id
 d2e1a72fcca58-7fe0c0fbefbmr11463420b3a.11.1766486968718; 
 Tue, 23 Dec 2025 02:49:28 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e88cd71sm13327808b3a.64.2025.12.23.02.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Dec 2025 02:49:28 -0800 (PST)
Message-ID: <a63f2bc7-11af-46d1-a950-60a25ef79bb0@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 16:19:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
 <20251126-elated-stoic-scorpion-25b630@kuoka>
 <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
 <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
 <503f445e-0d12-407d-bc77-f48ad335639b@oss.qualcomm.com>
 <e8bdb176-b6fb-4dd2-8b5b-9da8073fa915@kernel.org>
 <ca118faf-3451-4b83-9074-82bc5e1f731e@oss.qualcomm.com>
 <3e8128f4-3cba-4c13-a846-e5f1638a1e0f@kernel.org>
 <701a7b2f-848a-4cc0-8924-ec72155d93a7@oss.qualcomm.com>
 <65e5459b-7509-47db-9089-6efecead3f44@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <65e5459b-7509-47db-9089-6efecead3f44@kernel.org>
X-Proofpoint-ORIG-GUID: mnt_m5UfWPZakbDAkGJdhoBmnoaCo099
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4NiBTYWx0ZWRfXzx36m76OYpcX
 26Bt9vgNp054ENzmHbgrONHOwhnbInBWCu2XpcOl2BOubj71O3GPJVHGTdqDTVpkTViBHk8mPVh
 G7d+31fy3vFChBSuGhi8lOuaVIbP5Vg2liPHoW/TNPHLoskOtWVhY6pJvdNwfSiAIkmLZm6DAtV
 pg5ZBHSKlH/VZlrkPWJoqSxqhHvW/6XNcd2qzZpUJZ/1XvcoHJCMqvsdISMKm+iJqjvS7czq0No
 0ohlnygjm3jLyNFD7EsJW41X93nOfRhh9nh0DFtx5CSyZhiMkzmXvVYrAN5hpF8mZyVzZVmWseQ
 VscMyCnG3ZIZhP+C0PDnfbWO9Y40QpOzVUya65y5HpzStrjW4JWQnLkKjBFqTM5MoufeR7kCpc+
 zpy6GxE12JC5wEzktVIs/T3xj2pSiaJ7jPtdxCRHXqBTMqxWmYm7I0avwZgMFkRnvjA1rqAadKF
 ClMtKUrs3u5APOFToaw==
X-Proofpoint-GUID: mnt_m5UfWPZakbDAkGJdhoBmnoaCo099
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a73ba cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PurT2Iiaq-uxMnD6zWEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230086
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 07/11] dt-bindings: clock: qcom:
 document the Kaanapali GPU Clock Controller
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



On 12/19/2025 8:15 PM, Krzysztof Kozlowski wrote:
> On 19/12/2025 14:02, Konrad Dybcio wrote:
>> On 12/17/25 2:54 PM, Krzysztof Kozlowski wrote:
>>> On 17/12/2025 14:21, Konrad Dybcio wrote:
>>>> On 12/17/25 11:09 AM, Krzysztof Kozlowski wrote:
>>>>> On 17/12/2025 10:32, Taniya Das wrote:
>>>>>>>>
>>>>>>>> We would like to leverage the existing common clock driver(GDSC) code to
>>>>>>>
>>>>>>> Fix the driver code if it cannot handle other cells. Your drivers do not
>>>>>>> matter for choices made in bindings.
>>>>>>>
>>>>>>
>>>>>> As it is still a clock controller from hardware design and in SW I will
>>>>>> be map the entire hardware region and this way this clock controller
>>>>>> will also be aligned to the existing clock controllers and keep the
>>>>>> #power-domain-cells = <1> as other CCs.
>>>>>
>>>>> I don't see how this resolves my comment.
>>>>
>>>> Spanning the entire 0x6000-long block will remove your worry about this
>>>> description only being 2-register-wide
>>>
>>> But that was not the comment here. Taniya replied under comment about
>>> cells. We are not discussing here some other things...
>>
>> Right, you omitted the part where I answered your comment from the
>> context, so I'll re-add it:
>>
>> """
>> This block provides more than one GDSC - although again, not all of them
>> need/should be accessed by Linux. I suppose just enumerating the "extra"
>> ones in bindings will be a good enough compromise?
>> """
>>
>> TLDR: cells=1 makes sense as per usual
> 
> Either list them in headers or at least explain that in the binding.

I will take care to list them and explain them as well.


-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
