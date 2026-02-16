Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GeBHYX6kmlx0gEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 12:07:49 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12123142ABB
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 12:07:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88248C8F273;
	Mon, 16 Feb 2026 11:07:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97267C8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 11:07:47 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61GB5mP81759447
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 16 Feb 2026 11:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q/meIujfQJ3G4YCym/onp23xGAtccwS/AmTaTduP0MU=; b=Vfc7ZzBNLVRCgkcW
 nRVFDaeXCjRdSBSVu9jn4ZGR4po3g2Vq6aF3aoSCFXHI9wTspANQH8u+w1kN9xGW
 fMgfd0aOEW/Q5Qel6qxsDkn/e7Xm7lrUiz8/9yV3dSKZKoSyylXPzCDYYlrnezhR
 P4d+bINGrot1QRtbGK6MjSAoeT/9/vUK+dShdLnhfI4krqn5lRUAbA0qY26G+265
 NpghSbqgPzZ6q0HzavBlj+n+GNCQvLigvQVRIdOhjnsx9SNyCnTU6kKTODv+Mdac
 d0/JzaibLPmaqhg+BPa0eLyBY8RtIk0Buv9bRQDqbSVwp5Lord7DYQlQoEx7lPmR
 XQOsLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9hdkj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 11:07:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c881d0c617so1823103785a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 03:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771240065; x=1771844865;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=q/meIujfQJ3G4YCym/onp23xGAtccwS/AmTaTduP0MU=;
 b=YHLedOKmr9NwRjadB4bYurwjt1eNN6bg1thsMlkzAqWEzQkgiJiXP6Cph3jIQz79Rd
 eoJEFAmae//2S5pn8ZmgaUDFrElwHgpQVUQHiVbcRHzhakqAqAOlFIq+ECc6Eotkt3Sj
 aemWpAn/ScCJ+w1qAfDH3rgIvcrHjq4tdSpQHA+VBu9e5QQB15tlUt8P5MsPmsXoY9ni
 KSWHWOFB/hChfI2DjXIOL3JahqJpsZfcgEPzmEKN+3ZosSOmufZEZF/lt/rfBu7MraXw
 c9pFZqrb/fnglvyl4Vyg850z0p1NE3PO0ABlxsNgDd9ZwBNYP8qOTm8Sp+cMMNrpsemQ
 WJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771240065; x=1771844865;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/meIujfQJ3G4YCym/onp23xGAtccwS/AmTaTduP0MU=;
 b=hSwpwLl1CRFJ0Lx5/T5XoVbQkTUTvW9x6VmYmEC4S5/B83FdTH4fGpOqSENaGNETQ4
 u/a8Y9tFkh0dkGNV79c+SGPOlFspzkSH41dOTJnyVeb0QBZoheRoDVH17teeOuvVd7Bb
 bdjUQkWMPrjMz79fBuyFs+sTQBBsRkWJBHQAon/r7wnToztjceFsR2I3hV91mMkMBJaJ
 lOb3gHoCX1urowC++mFbj4poqHrnMIRWUk3mkK/118TvLugcGbsAeH9BiPZXqlR1kV7C
 4tRjS4iDucWVeclFb4eb62wSLHL7/hlhvuV3mB2xzevv3x5MsbmWoIJ91Ru1XuMxG4sC
 dj5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQGpuqw1M1uIZkkVKAkJNPztqrcJfTXXMJmAb2epWjJApd/Ob8ZGyeGIetLUHsQSsfyVzwqq1hQlPg8w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyuK8B9mt7066xD6vRYThKNyeDIvLpIeZQEXfS39P1qpE7XtheD
 PEN8PQ0gRDBveOy1OOus8ziYqXdbfEB0R+xY64TtEiibRVo+K2HF3bhdbEvPuEdwyYy/BL+4Gv9
 9owib1Zdq+VP8xZ2LJShPh9FUIUFBDMYEX7WTpT/XFI2NMj51u5/4og0OCv3mklhZHyVvgB8saK
 Wvv7/xR8c=
X-Gm-Gg: AZuq6aLR5a9F5PQ+OEtey/hiw4AMzIAp5WbJPmeAWk1PNduJ/PDuQmwwt1YogdQ0aE9
 FwUAAe8B38XM/1mQW4IJOf8Sd8yorLtwtYtxmghySv/KkdVDAtQ8ybf2EUz34uktBZuZ7RwLkjj
 wun0jSdgnQmEPeovmi6ilYu/n/N7G3wjHFxF5HNSUTjoCI4lvrdPxYSAKjKPPj4McJ7BJGi2ZHo
 VhScqpBKOYuTaNiA7vI/uFLBhwrwaxSVo+M+1FfyBz3/AK5OE/PhfglYWQPGykvY4N6WgvpOnBO
 Owt/NE2hYX77kNxlasYzEddLUw417HWXgMh22mw+YHtwq7VDctN03RWZQntkBg8E2JWwTkZH77l
 RaC0ktz9WRb2moR/ZJA2PitWGzIJFQ+cnernTimU46Wk1LQBtOg==
X-Received: by 2002:a05:620a:1910:b0:8ca:3d7c:e767 with SMTP id
 af79cd13be357-8cb4c00d093mr1016118885a.52.1771240065457; 
 Mon, 16 Feb 2026 03:07:45 -0800 (PST)
X-Received: by 2002:a05:620a:1910:b0:8ca:3d7c:e767 with SMTP id
 af79cd13be357-8cb4c00d093mr1016115785a.52.1771240065020; 
 Mon, 16 Feb 2026 03:07:45 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371998777sm294071675e9.1.2026.02.16.03.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 03:07:44 -0800 (PST)
Message-ID: <5823f778-d422-4190-99bf-d66ffa437f6c@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAC_iWjKQA0k+DTFpTDGieCK0qNL3=BCSiOPOtCo5gvdOtXd-cA@mail.gmail.com>
 <25d66619-23a2-4566-bbc3-83be8eae9d46@oss.qualcomm.com>
 <CAC_iWjKXcp8mmUaFphHRjJc+n3RNasVi91+_eP-mm3a9pnmYSg@mail.gmail.com>
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
In-Reply-To: <CAC_iWjKXcp8mmUaFphHRjJc+n3RNasVi91+_eP-mm3a9pnmYSg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: xnu7J_4e4XMjsgCWYq0Yrt3WJjo38JNj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NCBTYWx0ZWRfX3W+E1JCvn28K
 0IO7nlSMtsUnobbJWQMIfsk+iKogqz5BkmlARSawQcdet0Icu/NDztUHTjh64r8C6OMdtlgoCRU
 jkYCbbOMe+QkYQ7O3SSqUE0StFQXkObmbSCpT0UlHXUEqzMm5iBp2z7vLid4EAfITN/EwGgM77A
 NCihvpSqpJpWEUZbUQU/QeEixF+UQb7Uzb7ikAPddbyl7Y/T4wdr3V3A+mJPUUj7DzkyH2+0g5W
 80cP+ODIbEPvtnGJMhof52latIivn9u1rpRm9p/E2FFQdGBfiaLs+ehjijZVRI1GTaA6kboPemU
 2rcrD+pc5jIEIXVrCTKhOmuBUdlsbiq4EyLniUkza8Tt7cjr+UFgpA2LPqwV9OLmcjNehkFphiz
 QJy+e66GWvgiXIdgYxCgW7+VXm9iDLjpUsqLH/Jc5JIunZxLLjMVZy9qupwvTz9tg3/X1DWzrbX
 32lYBGgIF+17qXou2nQ==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=6992fa82 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=057-S8aYvNixUhiuP08A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: xnu7J_4e4XMjsgCWYq0Yrt3WJjo38JNj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160094
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 12123142ABB
X-Rspamd-Action: no action

On 16/02/2026 11:43, Ilias Apalodimas wrote:
> On Mon, 16 Feb 2026 at 12:33, Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>
>> On 16/02/2026 10:49, Ilias Apalodimas wrote:
>>> Hi Krzysztof,
>>>
>>> On Sun, 15 Feb 2026 at 13:06, Krzysztof Kozlowski
>>> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>>>
>>>> The 'struct efivar_operations' is not modified by the driver after
>>>> initialization, so it should follow typical practice of being static
>>>> const for increased code safety and readability.
>>>
>>> get_maintainers doesn't include me in the cc list?
>>
>> I use only get_maintainers and as you can see no. You might want to add
>> yourself as maintainer of this driver if that's your part. Or have
>> korgalore/lei filters.
> 
> Hrrm, that's weird. Running it locally returns a more extended list
> which includes me and Sumit Garg.

You might be using git fallback, but this is not a maintainer. It shows
random people either involved or not involved (like cc-ing me on half of
kernel drivers), thus it is not recommended for daily use and all tools
(e.g b4 or personal scripts) do not use fallbacks.

> I'll have a look on what's going on.


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
