Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2044B2BC7E
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 11:04:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E6F8C3F945;
	Tue, 19 Aug 2025 09:04:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D90CDC3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 09:04:19 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90Z3n007244
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 19 Aug 2025 09:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PtQwBBE7A/L6DYrB3suka029FN2KX9K7yxrcnIgCQII=; b=nb05A76YpPiOGSz2
 vwKgyfBmE6HTLMxdi6KMSAwl+lCIrsM15BUf4wC5FcFazt++cmigwggE66ZVHZ+Z
 LII/VhS37canuQuPj57BEoCVcQtDCQRHJZa1bDvjE7RmxNwQuI0qOdLDNEouVx1W
 RXipSQsgCZ2tXrvtKmTPYVnzEQY10R31absN9NHWNQ4LNLFpHAHGlrwczdPAbeZK
 8CvgKPFlbbnMT31my/tqNor12JVqpfefFg4bdNMJ7bIVA2gjNFoaNn6ovC/0KrYy
 e3hZjWpl7xsh7UcxJcedHUcNRbJkRpLhqe2wYrcCxtTZakAiMefhOTSv3tC8E9Lk
 zG1gJw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj747x71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 09:04:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b473910af91so2586647a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 02:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755594257; x=1756199057;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PtQwBBE7A/L6DYrB3suka029FN2KX9K7yxrcnIgCQII=;
 b=rV+Q8ARpO3QfR/r6/8TGvgdyp/NedWnekCVt7FNO8XRmFY9iTP2VqFifh+bbWDzVH9
 mF4i9S+/tYDd9ScKN/DTN7UsWzVSH+fV+FCca9BumcmNHQ0F21vEJGchTF/P74U+gYt5
 hxJxUUmem/oqypjjn5+lQjZOSqTDI0IboDUeWpzTIf6OADhkMdggY/fR8WKbm/NJ/JFu
 N/s5jqjskOpdP1Sw98b8Rp713RIgVW0zjt809layhLpPm7d87bfib4LN+tEHK7gf1Hho
 gS3ZXdvBqJsJ9HXXZXS69/YLD/YGtxWIC7nA+dTXQcwOa6VhP9udx8dWx/D+aWeUolu2
 k07Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2IUdG18zsn4Ro/xb4dPYinawFpbQXd7+EFjlCc0Rm94hO0f/GTX5eFv/ZmijJdTXPv8VkBlNklytV2Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzEo+rU1mBrPoy60vqFG3aSlc09yqJkNxFIgUVTFYjrPqIG/pL9
 nRtTCoJkbGnXi8qIkhy6D5Uhzl8FAgr4R9HibjiemYMItJ9nqutxUUQnuc3zW93oTkhdKcv/Cd1
 6ThRhr6mw4F9kEU0iWZ8RWezv47tL5FJ18OtYXwophcGp4+Gi3uljzRpoLOHciGllYokrRTDI7T
 PyZpuyLKM=
X-Gm-Gg: ASbGnct4eqldhr8zQH2auBnTyrWnvRxzsArKRoK5lzioqU7Ia1GoZ22rd62v4ARxwp8
 wVko2kKju/vRbhwamOq8Ien1+1oHEYOJ4bCXSi4Pw5CIzgbeJty+uhT4C/40eJUGFcu0TdYgf+o
 sg44QKkgq895xnU1tSKQTaz6lnuJ2FSQ/tvYFMBfaUYsi3zn016ZUvJYLjOuiFMRz45/YdkOnmW
 hCjtVwCDOf1edIF65qTep+QQNLqhk7XeSfHbKl5WfFfQbBXNjnLAX/Z+NqMb8/wRPhxg1RZ1mCK
 rxD5WMXaAtckRn2PnDqIH/FJb28cO9Xlt+fyjhWvhkxltK5XpQgJ5OFDrHDNPxRj9+hZclRBQx9
 PeFNFcY7V2SSH6l8WdzUZOGD3ZYuRc7Tw
X-Received: by 2002:a17:903:1205:b0:231:d0da:5e1f with SMTP id
 d9443c01a7336-245e0f2775amr16133795ad.21.1755594256724; 
 Tue, 19 Aug 2025 02:04:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkh7QwrfpTpI4CY81hIJagXgTCB6D+xkbxXMTtgq4VmPlFbLxOxb5dFrnqC4gKaobuk82+qA==
X-Received: by 2002:a17:903:1205:b0:231:d0da:5e1f with SMTP id
 d9443c01a7336-245e0f2775amr16133355ad.21.1755594256080; 
 Tue, 19 Aug 2025 02:04:16 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d50f8d0sm102888145ad.100.2025.08.19.02.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 02:04:15 -0700 (PDT)
Message-ID: <1394aa43-3edc-4ed5-9662-43d98bf8d85f@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 17:04:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-3-5050ed3402cb@oss.qualcomm.com>
 <c4cbd50e-82e3-410b-bec6-72b9db1bafca@kernel.org>
 <157c048d-0efd-458c-8a3f-dfc30d07edf8@oss.qualcomm.com>
 <0b53dc0b-a96f-49e1-a81e-3748fa908144@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <0b53dc0b-a96f-49e1-a81e-3748fa908144@kernel.org>
X-Proofpoint-GUID: kwjZdsx9xDtuyFxf2u9YGYyCe_QuWOzp
X-Proofpoint-ORIG-GUID: kwjZdsx9xDtuyFxf2u9YGYyCe_QuWOzp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX2ZS+593nq+FI
 FiAgAVpaxWfGqHTydOzg4e9xquTufV6y9Xesh6UO8I8Wxnh/QTXPIdAlFI7uf0SF8JO3flX6W4s
 Z0bKum+eyCvgYH2JSgRahQuCV9CMSqzDPukatNERbZpmuUuPEnxUMCd2ulc2txMZvSrVVa9lpa7
 7gTGL99sBHgjiQ8FNogfx+pRYkwp1N5hZGQ+rIjE9j+WyG1uYvDb0EIvTJN+b4g9KshBuJ/8JAR
 lXqBFktlSToaIHeUhkYHSkzjTT0VabdtssSOgm3gV6U8mQZjz+036jjwOkRReM4YTbEFqmcIiWd
 uSj/5doyBViSVs3skoF6nZyTXIfvPJpn6ZepuJrN4hDi+ETSTtCEDW5Y6B5bFjWE2OdtcOiWQE7
 kYcCquQ0
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a43e12 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=WpKivvdH6quKUe0GCQ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033
Cc: stable+noautosel@kernel.org, devicetree@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yijie Yang <quic_yijiyang@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 3/6] arm64: dts: qcom: qcs615: add
	ethernet node
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

CgpPbiAyMDI1LTA4LTE5IDE1OjE1LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDE5
LzA4LzIwMjUgMDg6NTEsIFlpamllIFlhbmcgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDIwMjUtMDgtMTkg
MTQ6NDQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+PiBPbiAxOS8wOC8yMDI1IDA4OjM1
LCBZaWppZVlhbmcgd3JvdGU6Cj4+Pj4gRnJvbTogWWlqaWUgWWFuZyA8cXVpY195aWppeWFuZ0Bx
dWljaW5jLmNvbT4KPj4+Pgo+Pj4+IEFkZCBhbiBldGhlcm5ldCBjb250cm9sbGVyIG5vZGUgZm9y
IFFDUzYxNSBTb0MgdG8gZW5hYmxlIGV0aGVybmV0Cj4+Pj4gZnVuY3Rpb25hbGl0eS4KPj4+Pgo+
Pj4+IFJldmlld2VkLWJ5OiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQG9zcy5xdWFsY29t
bS5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogWWlqaWUgWWFuZyA8cXVpY195aWppeWFuZ0BxdWlj
aW5jLmNvbT4KPj4+PiAtLS0KPj4+Cj4+Pgo+Pj4gV2h5IGRvIHlvdSBtaXggdXAgRFRTIGFuZCBu
ZXQtbmV4dCBwYXRjaGVzPyBUaGlzIG9ubHkgbWFrZXMgZGlmZmljdWx0IHRvCj4+PiBhcHBseSBp
dCwgZm9yIG5vIGJlbmVmaXRzLgo+Pgo+PiBUaGUgRFRTIGNoYW5nZXMgYW5kIGRyaXZlciBjb2Rl
IG1vZGlmaWNhdGlvbnMgd29yayB0b2dldGhlciB0byBhY2hpZXZlIGEKPj4gc2luZ2xlIHB1cnBv
c2UsIHNvIEkgaW5jbHVkZWQgdGhlbSBpbiBvbmUgcGF0Y2ggc2VyaWVzLiBTaG91bGQgSQo+PiBj
b25zaWRlciBzcGxpdHRpbmcgdGhlbSBpbnRvIHR3byBzZXBhcmF0ZSBzZXJpZXM/Cj4gT2YgY291
cnNlIHllcy4gWW91IGFyZSBqdXN0IG1ha2luZyBkaWZmaWN1bHQgdG8gYXBwbHkgdGhpcy4gUGF0
Y2hlcyBhcmUKPiBjb21wbGV0ZWx5IGluZGVwZW5kZW50IGFuZCBldmVuIHlvdXIgaW50ZXJuYWwg
Z3VpZGVsaW5lIGFza3MgdG8gTk9UCj4gY29tYmluZSBpbmRlcGVuZGVudCBwYXRjaGVzLgoKVGhl
IGNoYWxsZW5nZSB3aXRoIHNwbGl0dGluZyB0aGlzIHNlcmllcyBsaWVzIGluIHRoZSBmYWN0IHRo
YXQgaXQgCmF0dGVtcHRzIHRvIHJldmVyc2UgdGhlIGluY29ycmVjdCBzZW1hbnRpY3Mgb2YgcGh5
LW1vZGUgaW4gYm90aCB0aGUgCmRyaXZlciBjb2RlIGFuZCB0aGUgZGV2aWNlIHRyZWUuIFNlbGVj
dGluZyBvbmx5IHBhcnQgb2YgdGhlIHNlcmllcyB3b3VsZCAKYnJlYWsgRXRoZXJuZXQgZnVuY3Rp
b25hbGl0eSBvbiBib3RoIGJvYXJkcy4KCkFzIHlvdSBjYW4gc2VlLCBJ4oCZdmUgQ0PigJlkIG5v
YXV0b3NlbCB0byBwcmV2ZW50IHRoaXMgaXNzdWUuIEdpdmVuIHRoZSAKY2lyY3Vtc3RhbmNlcywg
SeKAmW0gd29uZGVyaW5nIGlmIGl0IHdvdWxkIGJlIGFjY2VwdGFibGUgdG8gbGVhdmUgdGhlIApz
ZXJpZXMgYXMtaXM/Cgo+IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCi0tIApCZXN0IFJl
Z2FyZHMsCllpamllCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
