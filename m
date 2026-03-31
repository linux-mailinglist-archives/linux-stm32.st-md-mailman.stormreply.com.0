Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIh7Ez2ey2loJgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:13:17 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AE5367AE1
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 12:13:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E4A6C8F283;
	Tue, 31 Mar 2026 10:13:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 971CDC87EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:13:14 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62V5oUUV1841960
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 31 Mar 2026 10:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I00HUMlFpbdKy1dJDRfaFyFxut/3IQjGIp0xHB+nWRU=; b=d5k+RIvtCbkMAd99
 ztZGN/zNYQrsTobAB1MdAWfas7w9n7w42QWCFCUtVvknWMNocNG5G0b05+n/f8m7
 6fEe6cNyrgDQjeLjZpGJB6dpHW/M+8mBfu/tOd8rSVaVsuyL7SaChveGF3QB0ZNN
 ziWFpkHUlb/GTHtajCl3Sw2N38TLLp/jyT5aeufl/bC3wtv/4d4gM5uJNtjKssTO
 BhZIfWuX+pXVQIrAFtKCF/ynSCGOJK/pQlbsanQfMK5vhQBjhyMG6diw5TBHXSdL
 63JAhKeV3DZMsGmQzSxHxeRNYceGirNiwd+6zpFIUCD1es6lajyXaoF2PtJRoIeH
 5x4BNQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsjjkf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 10:13:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-50917996cfaso46098161cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774951993; x=1775556793;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I00HUMlFpbdKy1dJDRfaFyFxut/3IQjGIp0xHB+nWRU=;
 b=iwyv1ksjKRUw7mGsDw1PvF8zUaoWKcco2f/cR1XjW8/lm2ZYqA0jE3WumXB9+nbKc0
 +ARBiAsbHHDYa60Sr0UgZJXb3mfo+jT+nWigEXJYxnF93N8VdjxuIZdqTBR1zcLOVh/T
 u3FBLh4xlyQ9KKwjWv3At5IHTl9BByESh440O61LwSuXSTFPdsVWdf/F9E+nqA7pCbqe
 NAt2eswPojFp7Wh4sNBIh3lnp2/CEOPd3tHpz1P+8V2DFPyLEns3PoQY2WdbYjXC0N2O
 tWbr9vK/171RL4qyx7a3jteV3M93oslsFV086e+wX/PIWW8jZTpxpv/yypGrOrALSMVp
 mznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774951993; x=1775556793;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I00HUMlFpbdKy1dJDRfaFyFxut/3IQjGIp0xHB+nWRU=;
 b=McgAco8Q6pCqvGcoy5Vrppf3ir3PJ8TAn9nE0u9NlZM125MMgtdmdEkVyuM1fMrgh/
 ad7ZAselMPLwTU0b2V+noJr+mqZEi9gfR3bA5mRsiZzUSdoAAnIW7E3jVzV6C89qBsXY
 FhsP2RyA3N9L+EUFHdAkY2DrZ4ES4HTSZ/lJIVhdxePyMVqJyDjh34ihWqavKdWMlpsT
 wnKqPeRmxJrtcQrVMQcAA5XQri85xl2ZmtHrnlrR1xWxMmqCNZXLJVWb20F724PPSNxV
 hlfNAtIxsVeVAQNjVWOw47oNuMN0qgSFj/oM35DFv155F9NKk6NUdmgeckaLnVp5a7wY
 g2ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVN8enzDygQx1565HA8R40aIuwt15jcJ/5f3NkZdhWYCzYlnMFhqoBi9D2TrTFS7T6Xwwo06mfyMhrtA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz20kJeD14cXl4NjzWoWLTnubd3CJRCrHaQGhlc1Eq1bjMTO749
 doGv48bqgLpY5FCJj6TdJZYMQFO5I00G7QZlBzMiseJY7bgGMlnKBNgcxwECx9eWDJhRH2uTlFj
 Khl6TIPSnFWHy/xY85UeFgwa9whA+VNlHybaViOdP0qZ5UKYJQsP1JKP2WDTBf0NGhfMox5sZZe
 0NHLQPpoE=
X-Gm-Gg: ATEYQzwJeaPt0wNh+JlGZUxiD7gNCvK8Q475v1AmQT/83CPUfos1l6jDkZjrRpYL9bF
 MqIHHexeZNOUB3HhEdlbe9v4/1FsLGrKf0WJKypsoSynUFlLUwHz9L95uG9B77rorIFpiW24k+o
 E0Ei9s0ojc48k27KyN0XD0WA6Ajw+pdJycqcP8+AQas82gmFdX2VzYqcQjDrU1onsCOjHtwVt2O
 Ur1KVdbSR0F0ftACHT4F7t4FGVzrNYzY92n9QaQVdKI0HW3McO8DVIUZsNFU0c6Wm7R7MJVdSGg
 AsoTRQr+ds4FZ94uObQOUTiZcv7GAy8T3M8s0sUvzIgB1DP9NAgZzhh3y8xWabIBzFZ1cVR74oN
 ojiCTPCn3ChxF9/KEz/wBcVMyes9O4eI3mw7QjCU4AkOwJowS
X-Received: by 2002:a05:622a:283:b0:509:1244:b83a with SMTP id
 d75a77b69052e-50ba37f623emr195160081cf.24.1774951992687; 
 Tue, 31 Mar 2026 03:13:12 -0700 (PDT)
X-Received: by 2002:a05:622a:283:b0:509:1244:b83a with SMTP id
 d75a77b69052e-50ba37f623emr195159851cf.24.1774951992280; 
 Tue, 31 Mar 2026 03:13:12 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e93cf2dsm22769205e9.11.2026.03.31.03.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 03:13:11 -0700 (PDT)
Message-ID: <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
 <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
 <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
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
In-Reply-To: <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
X-Proofpoint-GUID: QBablDruLgQkV5HDEhzVNMEIJNh0GKWv
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb9e39 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=B9NW21ypFFtUVvRuEjQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: QBablDruLgQkV5HDEhzVNMEIJNh0GKWv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5NyBTYWx0ZWRfXwGEnR8K7bHDL
 a/GB5zABno8UjGw8vNRQuEV2V4zEcSMQ0Lmf7Kq12f5YqC43Geu+vS4TrCQoGThnumU3GLh5uJu
 5Av0xGaFKz3ZmQCZMdMWq/oRDzML7mLPBo63KUlCmh/VPJlH5SKfJCLoZ6qmFuimIjDtI6rvunA
 3/Asm671LuDuhStFq0j0u5DCDp7ZQLuKUhzyHTNVdf3HJZ5OxT8rLZMxaHBtouRJN6ukIKQ20mv
 xouvfrbS+eWp8RTAlwq8VGczBZdEhc2ETjpqmMxHlLqmcr4jJwuqEfTh9LCFp4fe/CBqv5pCdxm
 jwUfKYsdLfmYhvlhYwKytWfnRx8GdsY+4LhD5DF+loqkDJJD3S08/4d+HjIVbKBkrwDepnEnxkb
 HQc4YB2tf9kjfskwZncu244/R80tfmJ/n4Q2DJpZdoq/kwMvZrn+KoPQx1c8bUpDP4w/vR8BeMv
 SnjLPFL71EHUHgeicyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310097
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.915];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,oss.qualcomm.com:mid,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: E1AE5367AE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/03/2026 12:10, Konrad Dybcio wrote:
> On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
>> On 31/03/2026 11:33, Konrad Dybcio wrote:
>>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>>> and is not modified: neither by the driver defining it nor by common.c
>>>> code using it.
>>>>
>>>> Make it const for code safety and code readability.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> --- a/drivers/clk/qcom/common.h
>>>> +++ b/drivers/clk/qcom/common.h
>>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>>  	size_t num_icc_hws;
>>>>  	unsigned int icc_first_node_id;
>>>>  	bool use_rpm;
>>>> -	struct qcom_cc_driver_data *driver_data;
>>>> +	const struct qcom_cc_driver_data *driver_data;
>>>
>>> This can be a const ptr to const data, even
>>
>> None of other elements in 'qcom_cc_desc' is const pointer, even though
>> they also could. If doing this change, let's make it consistent - so
>> shall all of them be const?
> 
> I thought about it, but then it turns out that videocc-sm8550.c has:
> 
> video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs
> 
> So we'd have to duplicate the entire struct

No, that's not a problem. Pointer is not modified and we speak here
about const pointer.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
