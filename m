Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E26B2D27B
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Aug 2025 05:18:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CEC8C36B2B;
	Wed, 20 Aug 2025 03:18:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E702C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 03:18:24 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1ojFE005725
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 20 Aug 2025 03:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1N/ucuPVyTyuNbkPcCCW3UQru9In3TiK2iev/+oe3mM=; b=gdoEGRrSMiZHcCc6
 Oo5swe3fsHJEfhNQ9+pgvKJjnB8H0gCiv4Wfiz1NZw1JdjbBEBnykd0DDKRxIE+V
 VkOZxED24WT/zu4meCWY4MclmKfzkTwdlJmlNFH4pe0LQOnu5UUoATxq6Q9qCVlk
 thlNab6rJABofIEzlVHIVkuX0/B9h4qta4DgFKzcx2ABdd/Cua/ofVIXWds1sJ0s
 z2+ph3z5CDFp19I6hLEz4x6qd+wZ7+B2STwLp2ogEFsfaIAmF6GpSTE8eV/0ioOq
 zPx9tHwmTtQLvCc3KSdGQimJeMvzG98dn75hIdBgHUAigUTz5ZGIoQo/fozxbpbX
 VuuNMQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cg6qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 03:18:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b47174b3427so5070016a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 20:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755659902; x=1756264702;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1N/ucuPVyTyuNbkPcCCW3UQru9In3TiK2iev/+oe3mM=;
 b=ernjYdo83mVEjaKrw4/eA5eBHMOJisynFB06vfw2oKBeD4YcxxACE8MM+EDr3irZ0o
 t8gLQlEG60Oeyr7c/lLW3xEFw0V7DoAZMFmZ6FYlRIAyWNAMXmw0h74OTHSWE2JhjQZs
 alu0QXooLZmajcSPBcqvkTZdcnDNdTBhkMD1xZ8sLFNi6T4/REDzGX1D1CKkpgjWrxRj
 1G4CkOq5ONw1cGFKI+gJjmii1nQS55oCkC/BLJZcSB+FmcoadD2kRw9WVMlUO+ZCNZV9
 favay5MB2WZ+pcE20R44YrGRZR30GclpmXpJMrNSVOSfSuCYHmCaVkjTf9MhFE+kLbn4
 UVtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV273wxxmelnOHWaRKF6YUosbOK5wUU1KGBBKvCgZTPn8Vi0pOHUM+B1hsSFeUkvZv9P0ifUsiqvZ9+Qw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxr9CVYmT6vie17PMGEWXRdFAULlyRgAkz1eIuS44fVojJVZQL6
 IVaC9la+OBBR9vOJoPGihpZzHdg6Un/C/WHtQvNaW5WYW0l78+DQqZ2ewPjyPp2lslFdp3qpniL
 81XVBGbPukF+DwHxJLjXNK4FTDmW1OIs8nyF0eG3btYsbHpFPs8l8NVjnqfvO8eVaHubWNOFpvK
 6MVORT4nA=
X-Gm-Gg: ASbGncvixAO7fk7poVf1bSGFTWWtqN5LOEu11W9ofcBKqvDd7Kkw2zqAnqJL481GZp0
 qtxFXfXCdOJDqcjXRQ5r4xvcGvXLrMPaO0kdm0YIqL7a63uLm74vi1nKA4jfZ/1DOrKwPInFBnF
 iUSRYKFSO5Fqt4gcQ9jQKUgbob0OnJpwEExgiHpeQ3uHEsF8cMKJCcD04tW3hJkSNDLSOcH2qQA
 VWwG+6el/rbzt4EaLijCYt2vLBNiUJwpiKFMHhPHV08CFWBh9LhkR7bX5EUlbrP9TJO2wPoCj2B
 qBCqjRR5rQ6du98VpnrcSBUN1L8zlbuCUAkNwqG4KJ/osIrBgDiXzElHx9JG5wVOk2buwh7ZSMJ
 36qZq2qNaZ6ptepCcZo8ZPSnDH2x94uKN
X-Received: by 2002:a05:6a21:6d84:b0:23f:f5bf:35d7 with SMTP id
 adf61e73a8af0-2431b988debmr2421280637.45.1755659901685; 
 Tue, 19 Aug 2025 20:18:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg42eG76MsaUYs0q0AlQR/5jkH+O6t3EbXik5YsVCq2cwrkly7cX1JNA8zlN9xV7ue3HTcKg==
X-Received: by 2002:a05:6a21:6d84:b0:23f:f5bf:35d7 with SMTP id
 adf61e73a8af0-2431b988debmr2421234637.45.1755659901283; 
 Tue, 19 Aug 2025 20:18:21 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324e253cff5sm702559a91.12.2025.08.19.20.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 20:18:20 -0700 (PDT)
Message-ID: <648e5f1a-5945-4562-b280-c12d26ad65a8@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 11:18:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-4-5050ed3402cb@oss.qualcomm.com>
 <813548c2-02be-40fa-bb6b-00c4e713d17c@lunn.ch>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <813548c2-02be-40fa-bb6b-00c4e713d17c@lunn.ch>
X-Proofpoint-GUID: 06Ao0HY1jgqJ81vOHgfiKNPCNGwK3iky
X-Proofpoint-ORIG-GUID: 06Ao0HY1jgqJ81vOHgfiKNPCNGwK3iky
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a53e7e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=TQ9DYVZ7-X13aS6S9P0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX87BxO4dmEoDF
 YqeDky6Ib4ofPIzfTmFekfg1IJQULHG3HQQqbd25bUFdtYR4HPpaYazHGrL+bpEOksTkPC3hGeZ
 1tcZhdQKnMwu4EjW27XSPIwlAQB7fhWcy8dsH+p2PKJFB2S/zElV+Qv0E81H4aLrvh0x2AJ3nhx
 D6tYwhNq9w4Dnq0g/ex6bJ6UlJrESncSoiixqNaKLxRZgNPxjnX/E0FguFxlwL5VFpMI7JnBAZZ
 0Uax9tyor93WgRAEXSq/qQ9/e7YEMpb0aNYbfkMJPN7lceZC8RUryEFoMaOFKbV4o00Z2PpRTP1
 mu2EVyZiQylFhpQaNSI7YjUNP1wmRdR1mhY1yh7LLKmJX/InYBUPq8sX1qMTn5g7HCajv5SRo84
 lwDAFx3QAJUM4r0pYCsOMmtWd+ZQjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
Cc: stable+noautosel@kernel.org, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Yijie Yang <quic_yijiyang@quicinc.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v4 4/6] arm64: dts: qcom: qcs615-ride:
 Enable ethernet node
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAyMDI1LTA4LTIwIDAwOjI0LCBBbmRyZXcgTHVubiB3cm90ZToKPj4gKwltZGlvOiBtZGlv
IHsKPj4gKwkJY29tcGF0aWJsZSA9ICJzbnBzLGR3bWFjLW1kaW8iOwo+PiArCQkjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKPj4gKwkJI3NpemUtY2VsbHMgPSA8MD47Cj4+ICsKPj4gKwkJcmdtaWlfcGh5
OiBwaHlANyB7Cj4+ICsJCQljb21wYXRpYmxlID0gImV0aGVybmV0LXBoeS1pZWVlODAyLjMtYzIy
IjsKPj4gKwkJCXJlZyA9IDwweDc+Owo+PiArCj4+ICsJCQlpbnRlcnJ1cHRzLWV4dGVuZGVkID0g
PCZ0bG1tIDEyMSBJUlFfVFlQRV9FREdFX0ZBTExJTkc+Owo+IAo+IFBIWSBpbnRlcnJ1cHQgYXJl
IGFsd2F5cyBsZXZlbCwgbmV2ZXIgZWRnZS4KClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhhdCBvdXQg
4oCUIEnigJlsbCBnZXQgaXQgZml4ZWQuCgo+IAo+ICAgICAgQW5kcmV3Cj4gCj4gLS0tCj4gcHct
Ym90OiBjcgo+IAoKLS0gCkJlc3QgUmVnYXJkcywKWWlqaWUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
