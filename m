Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16222CEEBA0
	for <lists+linux-stm32@lfdr.de>; Fri, 02 Jan 2026 15:04:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F629C8F280;
	Fri,  2 Jan 2026 14:04:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBC7EC8F27F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jan 2026 14:04:19 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6029WSOi618624
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 2 Jan 2026 14:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=; b=gmWAS9B5k/YF2KxC
 pUQLKgVfTCvW7eB18XPzrAXbjsLtFEqwFoekY1DlvPcq9nJEAAAwqOZL06d4JS9x
 3EPB+GriLWm4xz1H5rpr9clywND3baDb25GB4WG0XQv10GHvGyCXYqf6MXMYOCk0
 vwB8iPQtMBG1r4lwSy4I+rDPmPa7rSiBGXqz9ychUf/KSy1mIyoPIrFDCQpZ2h4E
 45VjA+uQ2jn6MmIWm0jFjZmhUl33AKRPDh5UFAtCdd8uAssXeii2caNh3Y6ZM/WX
 N8JHWp9gqKjscxBk22kkLvCSxWxlMcmQ9ntjHBQz+kdWUOukRXl6jgKRvP3azU1J
 9+nqrw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beb4wrh6n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jan 2026 14:04:17 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id
 956f58d0204a3-6446cbc11a4so4216566d50.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jan 2026 06:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767362657; x=1767967457;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
 b=N+R2HMhOz0HFN95m9p2e/L8zzem7eD1UbGULxyCztbtK/tmBl7rYWXwxtzf3peQotj
 kJC4any/wf+5PD33y5zlbOdZ+ZBO15uIfA2Fb2lXyUNyWqUBnIKjNUEtI8TdY7UYvyz7
 yn/TiSiA9xy4QCHXqwaVj3bvlvW1IoUrUfBHFHhD/vglVu1LMmfYAtgR+6UKchsQckim
 X/8Zmh4Zgh3CFrnTCHcS68kZl1dMZeiu2uYrxnvdFIJop55ksnruA2tEdll6gmpCYXqk
 gHOKl4RX/k5yDOfHxiRUbZktm7zmSxbalqKtXtyTdUjVOFPJzLch/ViHTSaH+p+9TGmk
 uwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767362657; x=1767967457;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
 b=PPeyYtQ2Y5wQlZHHtV53N0SMbL39AMLvJQrV1xUsCkjHfjZX05dFV75G95t90YiPy2
 cj5e6taognvH/oGgjIgfADSjdcdQBIjOW8Cf5pqJrEpbDbu3YdfJ27mV5AQ3Om4+GRcn
 AFqxSvYE16Vi3Y3zr5V0RHzIbbGr5GSGQkTXMLCKtTynxPsZXpmvpMPrY054gMc2aOc9
 w+hpywph/DqdUExojUBrdx72KnnXERQY6E4IA0ZJTcrHmPu12tlXIilRDCWVYdz5fL/n
 s9AON18G8zcLTk1B6iKSebatXg0GBoGb184O0Ji93p1Nn3flhcvDDRu7C3DSXFjWRY0E
 oNxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs2yGyVOWvL1CI97amIlBjWJPNG7dgj8isJ+M4N73t6REf/yl9dW5J5egKgXLFm3kjPgHoAMAcbY3bgw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxpqam7EuC0XcUZJ2kgsl3z+RPOCeW38eEt16oPFvCvTnol1czQ
 1I0kK8FOXeWdl3Ft1sS65ENqzwFBDodDcuYrwF9QMHGPmvFU6UIbXn6RcvN5dVTOuDvdfxxD4mR
 bUs33jMkEq8i7Ay1IXkk2ICdbx3+GsIuzIxFHmiZbaSZhIyA+nslGamQW6wsRIo+tRXnfiCmGjn
 Ajav+y9Zc=
X-Gm-Gg: AY/fxX6CBu1C3u/ua4/lzccBWafbyR7zTACDJm2h+hqPlDsRwKcgStFdBnqQ3Y6OCZ5
 FRp5+PsDJs7aBz7/kejeC/0MLXJH5XdV18fvALJQ/EvKr8vt3OSyBulLmB5R8Hp4UJFH0SvpgcE
 4t1o6yDKRGEu/WnBe26pfKBT18KcykrSpKK578t8/447jtqWSLX4b6Edym/ggFYREH9By31V6/W
 hmYMNzE27D5Nx8qTB4kMkbx9WljaD5FyJpbMrgCV+GJOPTeDbqBmJOt7FnCK2gRZUXH6d2BBt7T
 V8cnnWpPenFFidTXb+UJdbhTNGKeREwFzXprZw4IEMapexGSvsB6In5jTHLn7cd+K1VCkOlBheq
 Dbl6eTXUjjYlD5TQk3lo4zdYV2NAmMHXULIOhaedvvJLt8NWl4f9nPk7+fyvfddO+Fg==
X-Received: by 2002:a05:690c:fc1:b0:78c:2d45:519f with SMTP id
 00721157ae682-78fb3e6e5a4mr318529087b3.0.1767362657095; 
 Fri, 02 Jan 2026 06:04:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDY9o/Da3MH+qVOhc/qqaBC7t55MFtKFA+nrAgBn0dEzUb9bRjnu5r7OGAxL5CcAAw/v349w==
X-Received: by 2002:a05:690c:fc1:b0:78c:2d45:519f with SMTP id
 00721157ae682-78fb3e6e5a4mr318528797b3.0.1767362656686; 
 Fri, 02 Jan 2026 06:04:16 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f089fesm4586018066b.46.2026.01.02.06.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jan 2026 06:04:16 -0800 (PST)
Message-ID: <01a884cc-f5c3-4b1b-9fd9-7459227cf455@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 15:04:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zCwCms0IlmNOnuSkLIgrFTfnd1tUHsQI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyNSBTYWx0ZWRfX9bvfxuTsRc1b
 DTALNOnSagHpkJREL0QRzmK7scmUlTYgt/Ti1sOHTdJMtRg9vqeAMOW+Vvaa7cJWWH6BpbTmMte
 Yy5NsPogELMnXpNlwTsvITRpNoRCuiyyhqjiR1Mj2X3xP9ntZ01Rj8S4zRRWYrlADzMPdKsDRej
 8kvvk8dPvw5tnXRozBf4baG0kytGTUG7YDK0v1E7JTRDcWOP6dBpSfdKZ3bGuDKWmqJmhG9Cvil
 73RTVupCVqn1kgL7GkWOW5soUvz0x78liyZkd8lDkqAzMbiiklEB2JrbZVmGuB9nmQhZitnxlBj
 s1H5ffMFlLOAtEyqFQYUta2mblgYLE7KVkWtiLSKg14zbCAYEw8vBi+mPpDDKH73FpxTSb3kpo1
 brG6Qqf1vbwTw6yyP79S/FEqDjoYVcl4R+0p5+TvMWm5eJ3kFflWYmH1k7voAa3upGM7rqYW9uM
 63nWpHOOPmcRQr43a4w==
X-Authority-Analysis: v=2.4 cv=I5pohdgg c=1 sm=1 tr=0 ts=6957d062 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: zCwCms0IlmNOnuSkLIgrFTfnd1tUHsQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020125
Subject: Re: [Linux-stm32] [PATCH 1/2] bus: qcom-ebi2: Simplify with scoped
 for each OF child loop
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

On 1/2/26 1:50 PM, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
