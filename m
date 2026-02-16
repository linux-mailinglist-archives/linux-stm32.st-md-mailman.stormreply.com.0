Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDmiFY/ykmlA0QEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 11:33:51 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D5E142611
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 11:33:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E3C6C8F273;
	Mon, 16 Feb 2026 10:33:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 007D3C8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 10:33:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61G0FUeO3661176
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 16 Feb 2026 10:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7qT3PYfzNPVNMJsGBk/5dM82E1f/rJKDYQvjgXohlQc=; b=aNWm/E1UUw6LaAbp
 VaUBJ05xZeaBUDYlnGsWyioTIxpCTGrBq6BRS+F9v0blGCpVSKwkXkZ5dz7aG6r6
 jFn/FlYyeXbaLSeX/Az+KvppEifw/QNCr16JvsEUzFJisqhudSAwvJHTYD+DF9hk
 Nk+Fj2gnY9q8E9wXTsGTSWFcV/8nbAxlueW5EakVk0cl/aJnqICuEtY150uPs2HC
 YKYsOPpR+Iziuob8JSpHrLwp0RGBK/S9uGSLoEoMlKgE4UyOh3tMa5QURgiUG7EN
 kwD/ZnCwZ6nr/pZ89gApkdaSZW1JqunIkX3T8qkkC4HbK6jWfrp9uAOOiMKE2Tvx
 8P1aXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caj7jc2aj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 10:33:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c70e610242so1855057185a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 02:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771238026; x=1771842826;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7qT3PYfzNPVNMJsGBk/5dM82E1f/rJKDYQvjgXohlQc=;
 b=gUv3qVVz9+dl93j0UCxRvOcimFztyju1fj5GelFocuNdrjdO2OCTHPU+IFyT54TJL3
 wH5rRA3HtxGkIArc2ryoOJLI2RgJlaD87Y6GXzHE/m5aulA8uoQdJzc/MjYY8sIC+zgM
 To0fJJ/Xdvb1jLnQu4AUedw3sBcnT1GTPzM8hZSJPuYgM4Gj+bd17irMab23e1bGyOb1
 Rzie+lbN4bc9UkEN4oQ0YUa/TnbxAZfAKqVsg++bCHmR21zOWcv+hw+aE3QPUaoyow7X
 4FM3HIcCKIAXkJEMxaFfhClSNFOLAnjGB13CniSR/BFdcRwKAxK8DoVvScVedl192ooD
 OuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771238026; x=1771842826;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7qT3PYfzNPVNMJsGBk/5dM82E1f/rJKDYQvjgXohlQc=;
 b=oyZW+y5YK+ntzN6C5wOgya9BYxb71RcXKfMi/WOTtzEILuCT0+sW1h3hj4NYg0Cxqd
 Yr6sLJmZSTdxSGqZ8Te/JFKHg/CmeLQuHv0s1H7+uG5KsRUQE7ooZP/lCYn/EPbXpWLQ
 c4/9E+QStSzusvupp/1c8QqAGp+2/Q+Qdif/7aFxwTMlS7pGPqQQfc5LCWIiOAhDnPzQ
 6bWys5emwH5sD45sbYyVhr1Oi6obxMwRfui939KbcepgS0oP3JL8UBrTxQmiaw9ZQMyy
 YhTy40VklXbuXOZNhSOo9JnweNOZHmcK5nGBg88OiSuIg6wLTUno54BLWqjCbKg3f4X8
 wktQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURI0kPpou8tjI+Kha3RhnIXmxN/G3hea2HsCx/sgqCU27RBn9zb180QQd7ZHvlnyV6aQTnOSFd97nnFA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwqdfbwqnQndlBYmJcYXaTuU34cpMs25SM8l2i3I9xOvD13yqrx
 wukWi4f+OKz7wP/MQf/hhSvGK2bcM+WYkaq5w7Ty4LVqKGFKeZGmtUowh+8vX28foemoUJCOTh0
 05n9MbqslH2CcnK9rlrCRoaxdbSKYTtvfN6SAh4VTbtFA41g1816xbLIE9PQyjmR0yRkPPUxwwR
 8C84ndTeY=
X-Gm-Gg: AZuq6aLyqi6cTCkHksRNNHoXD45r9U9RixiC5VeE4A1qzUvUsLnUu3BsTSQooW5uYWg
 W8AA12RsOQbuYlTHZVb6vWePNcsb2fP7n/pzCi7r2bhOrWB3ZVScvncMyGJQceA346MwMpqaFz+
 fG5VCn6ut04I6iBC9RQ3kHCpBmiYPgNh9FLyliMPmd7nSZj8XQFjfP4eQqiNVk1ngzPf5KCo3oP
 0vh3EJxNt0ieY+A8lDH5kM1u9w63c9D9gsc4Ueu9NtNI0TD34fYWonRFT0Tt8bPalfhiooGpeIV
 1bEPE4KSV54zaIL9mIR7e2DrZsqcFphxhJC+zdfiqHX7q5SKU3cDtZFWe7LPdSyx61ubSmo/TNn
 lWzYJWiwRow9XzuCc1in+3oJklf0fIsNdxCsWp3UEfltybzTsjA==
X-Received: by 2002:a05:620a:254b:b0:8c7:f62:21c7 with SMTP id
 af79cd13be357-8cb42281159mr1182793185a.20.1771238026075; 
 Mon, 16 Feb 2026 02:33:46 -0800 (PST)
X-Received: by 2002:a05:620a:254b:b0:8c7:f62:21c7 with SMTP id
 af79cd13be357-8cb42281159mr1182790585a.20.1771238025643; 
 Mon, 16 Feb 2026 02:33:45 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4836aa0847asm454093795e9.3.2026.02.16.02.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 02:33:45 -0800 (PST)
Message-ID: <25d66619-23a2-4566-bbc3-83be8eae9d46@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 11:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAC_iWjKQA0k+DTFpTDGieCK0qNL3=BCSiOPOtCo5gvdOtXd-cA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <CAC_iWjKQA0k+DTFpTDGieCK0qNL3=BCSiOPOtCo5gvdOtXd-cA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=dIurWeZb c=1 sm=1 tr=0 ts=6992f28b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=4HEYRM_J1xu74ZP5z-0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA4OSBTYWx0ZWRfX6zsw8143Urxd
 XbTEec5fSLA96lm90mfCVnukQBdF5FrtrWB/Il9y9T5HXkHfyIiHAl82dJU+L0j9Djrq5sDhLX0
 P5Zmf6lkMHVXaVqj264Yjdbl+BXOipb/5W9kV1Kiazeafgsdl2wjgQfQmyLRkEvJ+mahyERCM+G
 b23lT3vXftZ+zm8K29uFJSZszYV2YBGSiHuctbigpzM0RK1RZJWgLJ9rSzoTj9doDIAxz6iKXKA
 ZvJ0qWujCeNOEmShT/nHE7zCp1E3FciIPUkpR2Qq2QO+SPYYSmrIHv2Nrgmm8XRR8BUHM86A2Ux
 yUPx6dNqGzvH0SWV9II3nfJtsymzUOjmJcsVqWxr0twy9Q1a1KzkzI3lnHjKg4rn5gBxI6Vsdrj
 SJ7aRddZpIhOPXrLR51N988lnKiuY0cw55TAb5I3E/xUdSXt8PwyIRymWIf3/zKI2drf7r/gzrK
 PIBaBd755QuHDHKw4dg==
X-Proofpoint-GUID: -0iVWubT1O_lBOy1ZkgQBXBbQ1ym9n8n
X-Proofpoint-ORIG-GUID: -0iVWubT1O_lBOy1ZkgQBXBbQ1ym9n8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160089
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
	FORGED_RECIPIENTS(0.00)[m:ilias.apalodimas@linaro.org,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ardb@kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: D5D5E142611
X-Rspamd-Action: no action

On 16/02/2026 10:49, Ilias Apalodimas wrote:
> Hi Krzysztof,
> 
> On Sun, 15 Feb 2026 at 13:06, Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>
>> The 'struct efivar_operations' is not modified by the driver after
>> initialization, so it should follow typical practice of being static
>> const for increased code safety and readability.
> 
> get_maintainers doesn't include me in the cc list?

I use only get_maintainers and as you can see no. You might want to add
yourself as maintainer of this driver if that's your part. Or have
korgalore/lei filters.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
