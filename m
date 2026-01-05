Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B46CF42B7
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 15:38:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CE08C5A4C5;
	Mon,  5 Jan 2026 14:38:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D60E5C5A4C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 14:38:10 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6058Ktjd3798232
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 5 Jan 2026 14:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ti6doOokkOuf1fU82BjOqYUG2AtLj8E38n45wx271uo=; b=Sjz5YZFkbaAgPHjf
 Xr9nC2IK8gcOosOfbQR9gmuDiLdzRNN5Gn80x+bjHA2o3r6yQdPWewpxp4r83EiG
 Zv1au6np+62NArsD3ELCAopT/5HYpXUqLYBd57s8/Y2kwb0VU7Pu6Ib2+scoeMjc
 XQ1fybwC1yz7qIJ5t64pYUsPJj/rMVzHYBdCnIMmcihLEuaSzveP3gHrD2aD8AMu
 yaRi2Fi5N/SxdCuFh3uQ8TasAG0N4yuZjqXgZstePbkeYhoU/5Ncw1paanNhNFop
 +0wyqVHuwnX7aqdQz0LZLyqB1xqVKdCyo3Tu/zH0LuE+AgAl8ObPt730ZVAf1a3p
 Hv93GA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4rta-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jan 2026 14:38:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee0c1d1b36so50092821cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jan 2026 06:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767623888; x=1768228688;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Ti6doOokkOuf1fU82BjOqYUG2AtLj8E38n45wx271uo=;
 b=GIOfuEaoNejGAHojGY3qxK7OuV7bTq2qG2dgPOMbAi5hAWP7Cpqgl2NR4+d6kPHk28
 aNtdTUTulMxq20aqIilhn9dPfkiItiKOle4EK0xNvWGrmdDCaw0feG+YjI4O+vbzbnZS
 5yJu3lfy5QJ/ntfe+a28hrWc+ncG6gMXH3Yrn3RqSSIz65k0+/BinXdpZKkAnAbHq9Rl
 8oQGx+0AHycMIqmXHtyM5d+q2mqsYBsa5C5uuCr1OI1xa4f04pcOqLcpHp6MfH4OOWzP
 wlWNqSNfoy576FIk6p3VzV5BJyj/eLvkkPZNWCiywIqC/WQRx0POdBpzvDSBrj3GnJNI
 sTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767623888; x=1768228688;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ti6doOokkOuf1fU82BjOqYUG2AtLj8E38n45wx271uo=;
 b=tdaheayhLsHhAXCfWhHKI/kemr5v3OcQT42dn3+S1BkWwTmCPE2Sun71RgXcQnyRJ2
 FJUhrWao17+pbb5PBn6EeioKAznyLPpqO+v2Yud3Lkw97zZkjc9/6mJqHPLRuwurSzUX
 zLfD5BJeeEfboun3UVw/4JDupqDCQ81XqfeF1Lq1ZM/LwXVgIucipd1Wv1onzHz1PEex
 6xJV1OLUDsBdRMXOCqIInPYmVUF5RmCWzKTj4PXjwdYrMCbhTeUco1a1M1IdRtzbXZKX
 9HTFSG+Jl9LBV4eTYXAC0JvwWJss3Hg8+hmM3hZFKRcCp7Ay+lVfLhTVieaVaTI6WXBJ
 rUpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdEwNjNyWmdyBRVz02DWx7XikldJ7Wjfu0ChhTHxxTNdQX+DqJxg+zl4frl7avRxTBUe1rK0LWdjEk4w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyC/OFar6yvaCQ4mb5UysDpbjPEypN3XlMtgNfC05XrmuQvQy1Y
 brSU+Jx5MopuNxLM16F5/mpt/WSTaFAZTTpNSoIcwge9bQLcIujS+QLLQ/Q2eYK+B3RRMBiFHmZ
 62EUs6mVjZVzeLMRzIw7by7lbL+7rdLlJYxitzREfoukrwuXiXgj6WaHTD9I36iF88OPkaMsH2K
 R7tgqXcac=
X-Gm-Gg: AY/fxX6VrVytIzkA9r+da6p/lFTvkTrinVjGMrmAckwZoLMAogWqRr43+xWvo0Y3yV1
 rrOVEVB1xrT1oYEksJjKGkOkN3/IMimC8H62zKHWKuLutyWTtrZhLiv6YJ0CYw2W3hTfz2BJaAS
 myeqFtovoJIJk79cBT1rOxj478WTYphF0xK+Ljh1iEyr8Ui7naUEUH9KTLmEDlygp547AaAiBVl
 tUfx9JtPrfo1kmLsffv8yBSwvpPfh+vxvANGx3ESVSIzwV//uAuqhhVtywWWZMkQeRJ1kEj/clL
 EGHzEzARebLWH+/valKiNCm7uKTLwl3OQWSRtgxZgbLWtMVz4n+QjePtgzoLegDreROGK8i+j+X
 nhMMV9SqRIOBaF8D39F9OGAbBVpbFPCGaUsH0sQ==
X-Received: by 2002:a05:622a:1188:b0:4f1:bd8a:9fdb with SMTP id
 d75a77b69052e-4ff4508b502mr108113011cf.2.1767623888127; 
 Mon, 05 Jan 2026 06:38:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgicMyDjA5PM/+eqsrIBwMK144H65yoEKhRKChcbGfAHLmAZEHZwjzOBn9OnYAC/WqGr9WyQ==
X-Received: by 2002:a05:622a:1188:b0:4f1:bd8a:9fdb with SMTP id
 d75a77b69052e-4ff4508b502mr108112691cf.2.1767623887721; 
 Mon, 05 Jan 2026 06:38:07 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b84267a5063sm3411466b.69.2026.01.05.06.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 06:38:07 -0800 (PST)
Message-ID: <715cb873-6bf9-4902-b586-f02ebf5a611a@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 15:38:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: C9FUcLik5hu5uQrMQ_qU_TdLeLNkEyYn
X-Proofpoint-GUID: C9FUcLik5hu5uQrMQ_qU_TdLeLNkEyYn
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bccd1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pJbpxMvPcy3AeZgjqcEA:9
 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyOCBTYWx0ZWRfX/yghNskWRrk3
 YX9QDFlu980oN7cCnkP/MxmY8/ta67sUMTv+F7qcy5PVA6zf7bm2qFj5Tz5LzuWK4XBrEbnmYm4
 BDYbzelx9JThItokQnl6oHwzlhZ445whXqzRQ5pA9uGxR+cBVlQ+P5O4cJsM3O8dTYtTqeSRHaG
 zHuwZd4kz0/aGfr8/gYD5y6CKD/W61pLQZoJelmjgNc+O32M8XgA63qfigFrwGihvhJCw7SnrKo
 utrB/zPpvWb+ytUmbI2IweEA+FZ4hITdj8rLiaQ3fH2dSivo4Gstyifzxr17iPTJha4yxs0nkMv
 jthlrTZ5QSD7wMdCYOSwJtAq58+CKzTEsrv1mjzmIM5+yeDGW+lFAD0VlMIoPEHe3i7yAl20ZxP
 IFU3gr3nOMT2dXDjcy7hOP+7H/UbkM/+fvbWnH4kiMQlgQ+8qklfm7oQMMMSo2GL7Vs70E/kbvA
 YuRg2IV1SpYEmPZ5Zqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050128
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [Linux-stm32] [PATCH v2 1/3] bus: qcom-ebi2: Simplify with
 scoped for each OF child loop
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

On 05/01/2026 15:36, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Add Rb tag
> ---

Please ignore this one patch #1. I am sorry, this was already applied.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
