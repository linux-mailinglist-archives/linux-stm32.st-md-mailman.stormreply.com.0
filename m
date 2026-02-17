Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CgqM21glGnODAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 13:34:53 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D3914C024
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 13:34:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2EE9C5A4C5;
	Tue, 17 Feb 2026 12:34:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0551DC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 12:34:51 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61H90lMZ289398
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 17 Feb 2026 12:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RvEfrZDrpuXSo+8UNBbEgYFKbls9A5JiTcAP/1CGaK4=; b=LiAIaRXs6HrgIe0+
 27FH4f1ZJkA90Rn3x5DuZnLxWfb7ctBdh1/h9y3Y6nFB1n7y4u2xewOr1l4VMCLI
 U+QdDR0jpa1truWImPQNSjcRzZT7En5fDGHU0T6Km88oJSt0MBsOWytfUC4a6XN0
 GODy77SLMl/95YPqBphumuirnDZjftkrFL454+ih7VITZXTbMXOlk0Y45NN/lt/2
 7Ek5yD8H/OfQs3mAfkLamPiTQM725CLBc5DeV1Xyu/l6eLO0CUCNoAf3+pmAK1AV
 GjTggxvXufhDb01ph8JhDoM/RtfCP44zkHThjOh8fULjF5M1zKIakjtDetK+GJEJ
 nll9VA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrta9v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 12:34:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c71500f274so441526085a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 04:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771331690; x=1771936490;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=RvEfrZDrpuXSo+8UNBbEgYFKbls9A5JiTcAP/1CGaK4=;
 b=RPxTmf42gG2lgTFn+ChsH58ltiI8e8AmM74ieBUylBFHAnoAfmbRiwxHuH7NenCXEh
 gBYvsgOQL6qY65E7CoYyA+b6pTaXg1UsI9mIb03KTuBOKfk04AC5z5Mw7bKo6aw6ajjM
 gA0BH/eIwUMAw5oup1YhJoGslTFBPUPrZXX7TsNkyhAMOhCABPJMUnh0p/FcZ0PBXzE1
 J0sCo5/mtleqIGRVePkK3S79JoeM2sH0zGvjtAY/oOfgtMaVnczNWlJKzT0ALpdjtn4D
 5YaXrGYDnJWgvPAJnyK5a+e4lcbzkQ6n9AMmF4M6j00/X6JglGGHWgmbpPNMEO8qYB9Y
 Fo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771331690; x=1771936490;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RvEfrZDrpuXSo+8UNBbEgYFKbls9A5JiTcAP/1CGaK4=;
 b=JEUyeiv4Mlp/VtiTDALi1U1imw76X2qLrDf+qYU5I9Yzj6j+UVIepLWhNlLc++VZ1V
 zHueS+U3IVgxzuDNax/zf1fVKvMAqoBxFuVoN6FhPwVK9VNh3Dfoi0iWNJJVU+IrJW2L
 rGGnutvxi3ZKMTeyXJTNYxSJh3Kgh/T2USQVE3IqYa+NLqRzL99KS8eWeJOmKVcvWid7
 MOjIy+N7A82iGqj2og6csN9wbG5TqYPJ4sEiKBvtv35UKMHxEuCgqPDAeMfQ70yKrOJp
 m3Vskzj8VmD15/OSA6/bVHZ4KOxTQs8gk1w+xx9w7TV0W6PSaTmApX2ZnqLFmcU9Ihnt
 IxZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4doVkUvrQkyu2Ci29KTpCkQgysopgrlzAKwlJcq6lVG5i2m/VNGOs7JUerAy6OL7YT5u7jXQYo7cJlA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxG4Md1cMLwWojMP2sbQkHCKTS/p/bxVlr9f/1lSzVhWGcBxT0i
 NHtxpCQs+D2UATnUZRy7bzPSTuo2qQ3gwZLnMvc1VpvT7gf+lMPzjvJkUWhHhGDXFTKCWW4cCSe
 sRd+JA9/7TqLSP+OwMO60G/DXVkeYrTSTINVFCU3kNZMd9VKM1ZFQPhe4YfFAtlPPqmA49wh0mY
 rFtxiGipc=
X-Gm-Gg: AZuq6aIsXsBxAFYqy7dwKRwpKsdvn/zG4oqOEeuU5P+pwTr4dwkKRh08J3Txxb14ee5
 eTEloPt9vTLD07ANztIbSF6XSpSq1g2kEiGDNRVPi3EwsGeLs1hk6mo0QMZpAcYc/ppgCuoVB3F
 fwQIJjvaJ1nwOAPeqe494ZV8xrMlqJ8ACPVuYICsNkDF88WPcsCcMMqTbTg0EkD1dC05/Ro++e7
 rw5Kw/qQ4WJUoZOXVyuGXj0EmCfCNA96wWD+Ncbhsh6AJjjoZrzF2jVVgzWdXC6Pa9muwb6k4q0
 /soO8ozWL5dHflVJ0gX+JyBY07xsyO8rv+usahA+HZspwO8WJ/bCnNvzH9MMYJmOXphYB4YsfG+
 xgeRRrQeV9m+6/laWM9QthlPRuwBy8r8luNZwvEEmUtqhNTx4hQ==
X-Received: by 2002:a05:620a:1927:b0:892:7dd2:9f0f with SMTP id
 af79cd13be357-8cb4228d6d6mr1362114285a.19.1771331689729; 
 Tue, 17 Feb 2026 04:34:49 -0800 (PST)
X-Received: by 2002:a05:620a:1927:b0:892:7dd2:9f0f with SMTP id
 af79cd13be357-8cb4228d6d6mr1362112085a.19.1771331689224; 
 Tue, 17 Feb 2026 04:34:49 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac9d77sm31558282f8f.33.2026.02.17.04.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 04:34:48 -0800 (PST)
Message-ID: <a2bd86d1-58ab-4a03-9539-74406b20861c@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAC_iWjKQA0k+DTFpTDGieCK0qNL3=BCSiOPOtCo5gvdOtXd-cA@mail.gmail.com>
 <25d66619-23a2-4566-bbc3-83be8eae9d46@oss.qualcomm.com>
 <CAC_iWjKXcp8mmUaFphHRjJc+n3RNasVi91+_eP-mm3a9pnmYSg@mail.gmail.com>
 <5823f778-d422-4190-99bf-d66ffa437f6c@oss.qualcomm.com>
 <93de9e85-faf1-4394-a374-f9207bd823c7@app.fastmail.com>
 <3ae05b60-0428-40ec-a6a8-e60395a8dccd@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTpLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+wsGXBBMB
 CgBBFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmkknB4CGwMFCRaWdJoFCwkIBwICIgIGFQoJ
 CAsCBBYCAwECHgcCF4AACgkQG5NDfTtBYpuCRw/+J19mfHuaPt205FXRSpogs/WWdheqNZ2s
 i50LIK7OJmBQ8+17LTCOV8MYgFTDRdWdM5PF2OafmVd7CT/K4B3pPfacHATtOqQFHYeHrGPf
 2+4QxUyHIfx+Wp4GixnqpbXc76nTDv+rX8EbAB7e+9X35oKSJf/YhLFjGOD1Nl/s1WwHTJtQ
 a2XSXZ2T9HXa+nKMQfaiQI4WoFXjSt+tsAFXAuq1SLarpct4h52z4Zk//ET6Xs0zCWXm9HEz
 v4WR/Q7sycHeCGwm2p4thRak/B7yDPFOlZAQNdwBsnCkoFE1qLXI8ZgoWNd4TlcjG9UJSwru
 s1WTQVprOBYdxPkvUOlaXYjDo2QsSaMilJioyJkrniJnc7sdzcfkwfdWSnC+2DbHd4wxrRtW
 kajTc7OnJEiM78U3/GfvXgxCwYV297yClzkUIWqVpY2HYLBgkI89ntnN95ePyTnLSQ8WIZJk
 ug0/WZfTmCxX0SMxfCYt36QwlWsImHpArS6xjTvUwUNTUYN6XxYZuYBmJQF9eLERK2z3KUeY
 2Ku5ZTm5axvlraM0VhUn8yv7G5Pciv7oGXJxrA6k4P9CAvHYeJSTXYnrLr/Kabn+6rc0my/l
 RMq9GeEUL3LbIUadL78yAtpf7HpNavYkVureuFD8xK8HntEHySnf7s2L28+kDbnDi27WR5kn
 u/POwU0EVUNcNAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDy
 fv4dEKuCqeh0hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOG
 mLPRIBkXHqJYoHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6
 H79LIsiYqf92H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4ar
 gt4e+jum3NwtyupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8
 nO2N5OsFJOcd5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFF
 knCmLpowhct95ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz
 7fMkcaZU+ok/+HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgN
 yxBZepj41oVqFPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMi
 p+12jgw4mGjy5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYC
 GwwWIQSb0H4ODFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92
 Vcmzn/jaEBcqyT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbTh
 LsSN1AuyP8wFKChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH
 5lSCjhP4VXiGq5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpF
 c1D/9NV/zIWBG1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzeP
 t/SvC0RhQXNjXKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60
 RtThnhKc2kLIzd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7q
 VT41xdJ6KqQMNGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZ
 v+PKIVf+zFKuh0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1q
 wom6QbU06ltbvJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHp
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <3ae05b60-0428-40ec-a6a8-e60395a8dccd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=6994606a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NT1zQuG-P9saifzZ494A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNCBTYWx0ZWRfXx3aqWL8g5ObM
 QAI5XkYLoWKymUWlFj/xKIosFcNx2bhUhOwEj/qWmZBYWIkL45T9Fe+JHh3YiJ4OznuYBv+3IDU
 sY9b0YPShk3e5+DPN+ju63fh8jzWCQrun+NRNCcrP1gd88dTn2YRDH6BB/6YN5vGQ2+oFhaRav5
 7cCBPMu16VG3K8lwLdln2Oti4Zof9U/ZWedkaPstZ0bU4YRGnZ4HUnO5MmXeM8GIVQQJSKvo7Hy
 W7pA6xEGuIqPkilgwE48QCkjZtp7tLJaSchQNhlcwHgRygTVHviXzyPGAYYXnZCee7WNYNwtWhr
 4z7aPN44L69Ytg5VrA1ZU04LJEqkqulF3tSj22YhWXQQfXVuuVqf3cA7Ez4+poP30LUumWX2kXT
 zZFfCc8ObTNAdVLThs1Op7pNexa00D4b9GSPRvzu5a5f7cXZufOC/h7JblZotiTZKWM2H3grjkh
 XAuOo4bpKCISvPRlRIw==
X-Proofpoint-ORIG-GUID: VieZnZw7sLs2oq62iaoJsfBws0_feRFQ
X-Proofpoint-GUID: VieZnZw7sLs2oq62iaoJsfBws0_feRFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170104
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] efi: stmm: Constify struct
	efivar_operations
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
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,st-md-mailman.stormreply.com:rdns,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 78D3914C024
X-Rspamd-Action: no action

On 17/02/2026 13:25, Krzysztof Kozlowski wrote:
> On 17/02/2026 12:30, Ard Biesheuvel wrote:
>>
>>
>> On Mon, 16 Feb 2026, at 12:07, Krzysztof Kozlowski wrote:
>>> On 16/02/2026 11:43, Ilias Apalodimas wrote:
>>>> On Mon, 16 Feb 2026 at 12:33, Krzysztof Kozlowski
>>>> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>>>>
>>>>> On 16/02/2026 10:49, Ilias Apalodimas wrote:
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>> On Sun, 15 Feb 2026 at 13:06, Krzysztof Kozlowski
>>>>>> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>>>>>>
>>>>>>> The 'struct efivar_operations' is not modified by the driver after
>>>>>>> initialization, so it should follow typical practice of being static
>>>>>>> const for increased code safety and readability.
>>>>>>
>>>>>> get_maintainers doesn't include me in the cc list?
>>>>>
>>>>> I use only get_maintainers and as you can see no. You might want to add
>>>>> yourself as maintainer of this driver if that's your part. Or have
>>>>> korgalore/lei filters.
>>>>
>>>> Hrrm, that's weird. Running it locally returns a more extended list
>>>> which includes me and Sumit Garg.
>>>
>>> You might be using git fallback, but this is not a maintainer. It shows
>>> random people either involved or not involved (like cc-ing me on half of
>>> kernel drivers), thus it is not recommended for daily use and all tools
>>> (e.g b4 or personal scripts) do not use fallbacks.
>>>
>>
>> The code you are touching came in via a different tree in the current merge window, and so this patch doesn't even apply to the EFI tree. Those 'random 

Heh, and that's not even true. The code I touched came via YOUR tree
with your SoB:
c44b6be62e8dd4ee0a308c36a70620613e6fc55f

and not in the current merge window. I don't what commit you are
lecturing me, but I see:

"Commit:     Ard Biesheuvel <ardb@kernel.org
CommitDate: Mon Dec 11 11:19:18 2023 +0100"

There were however context changes coming from other tree which affects
applying the patch (thus won't work for your tree indeed), but if you
just bothered to check, you would see I don't touch ANYTHING from that
part and actual code I am touching is from 2023.

> 
> It can wait till the merge window finishes and then it should apply
> cleanly to your rc1 rebased tree, no?
> 
>> people' are the ones you should have sent this to, if you had taken the time to look at the history of the code you are modifying. So please don't lecture other people on how to use the tools.
> 
> We are all using the tools. If Ilias is/wants to be the maintainer
> (which I support), please add to the MAINTAINERS file, so the tools will
> get it right, instead of relying on manual process of finding who
> touched something. Contributors should not figure out how the code ended
> up in the kernel because it does not really matter. What matters is who
> should take it, who is the maintainer.
> 
> This is not a fix, so original author won't be pointed out by
> get_maintainer poking at Fixes tag.
> 
>>
>> I've queued this up now - I'll send it to Linus by the end of the week. Thanks.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
