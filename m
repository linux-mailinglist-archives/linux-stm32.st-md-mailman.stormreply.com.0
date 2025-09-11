Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 613A4B52C40
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 10:53:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD0FCC349C1;
	Thu, 11 Sep 2025 08:53:35 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40FDEC36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 08:53:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2InW5027092
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 11 Sep 2025 08:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ynWl2+LN0okkZhiNEn8Jl42YKjFcoHHouZf21AAoHq0=; b=OrIY/QGAjyiGsCvf
 Dmxj++57E6yEaDivTVuW7agmMUOYVnC/DM5C3oLOgZuxx0OCoj8r3Lf58/yLCjNx
 x2zKTAvM6/VIyfu4Ob/p2P+uMLolymGRxGIjExVMyPEy0Wz8bz1SH1/CEMDJKN17
 AJFUJ39O3bXtCI0zB99HZs2ouvKC/RrC1QH/CN0frAAic/bLsJGwXY96olQSdPdD
 aLJgznelxD2iQAATm+WkFealh2YMeYNtuscpRVSqXQcUhIn+ONuHSDzRP5FwU+xv
 0Sx0y+JpQh/Vq3qzD6Wer6WeilyLnVDkDGpEM1EDHM2arVchyWdLKp4UOurR27dI
 nAYTaQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h1y0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 08:53:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b604c02383so2510121cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 01:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757580811; x=1758185611;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ynWl2+LN0okkZhiNEn8Jl42YKjFcoHHouZf21AAoHq0=;
 b=hDouFekhI3XxOhI2eWdP3L7TaMYpeR/ay8bFekM5glE/8aFEejWLjN07neCzDpO2rI
 ETDB6OYNksGTmiHaI8ymTSNQf+zG0lXzKx7nsL9RymL4pfsVKYohHwt/9TC1o7XqY6sM
 lp7jdwwsH9W/dh16AdQem1PJ+R7K3mV8LGhAEzpy84FnxGSxUAcCXrcsxP+FLBVmSq4C
 V2yYkwKCRuDR26f403/xN0LIevgNToNcb6TukOyrv6OUS8o5es8l2ZJLD39GquV4mw8F
 W4ySmC5dvB2L8qyMGMa0mFXwgzBaPmMruXmOp2PQYRjrXZwgY36y2RSpVx2D2hxdw330
 PPsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHJRfSkbJejWMRhA0CugwHvTb1efVTDCn1BZcabCXevSLm/xZ0g1Y8q+rgWfP/I1TBpBgdt5wZt/At1g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyswGwH49kiCbuCrZkf7gC5JJwRc5c/jZXoPX3ZLbmtXgPYXB6+
 y4NJL4JbegKqElkHb5f5IRhvTiH8OxFaXS5WqdN8bT1r5bQGuN5HHKQ7iBV3hj5RTngKZZt8vng
 N6Tkw5ZfR+RgMk5Wj3YsdAZ8R4Vqc0poW5jb4+qdWDvozyprEp0hcQLGwjQ3Ycek5ITaWkWRNI0
 Na77pVvDU=
X-Gm-Gg: ASbGnctNusO0wdqfOsdonKeWmC/u70Hb4qKnZry+d6dZwv3nqw0/dbPa+Nc06NWHOaZ
 gM11Iw/1d9Dm3FpqO2RDQapoU8EKbDqtBPIt8CEXnju2E23IXU2FKplSeHcvmuukr8mGKciLOVO
 E5i9V0tUXp/2HnftbP3s7HJeggddiOqhA9+Gn0LUBRS3SpGEOcmx5GDyoDkjWc1TDQYHa/Ybufu
 4NjTRYxQX0yUEnodyOLZbRp+ffKzxn/DfW4kj/wGCtcZaEODQVsg6Dvm+sEUINlNUzlLFujol/l
 69acn0NQ0JRzuge6nAVrUuGotceTrqWqIVqu/tx2wMlMUtLcKOGLbqo2Cw6UKGhCCGbXiIUNqOq
 XuHMQTO9aeQI8vOlEObDhNw==
X-Received: by 2002:ac8:5e09:0:b0:4b5:f68b:86a0 with SMTP id
 d75a77b69052e-4b5f83aa98fmr140394571cf.5.1757580811167; 
 Thu, 11 Sep 2025 01:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwrCXlNX3e4J1CCi9Qj59YkjWyURxTP0akIJvONe/E360yXgamsqbmCNGDwjWVWtWm2ONHng==
X-Received: by 2002:ac8:5e09:0:b0:4b5:f68b:86a0 with SMTP id
 d75a77b69052e-4b5f83aa98fmr140394291cf.5.1757580810734; 
 Thu, 11 Sep 2025 01:53:30 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32f20ffsm86223766b.79.2025.09.11.01.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 01:53:30 -0700 (PDT)
Message-ID: <b83a59f9-16ae-4835-b185-d5209d70a0f6@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 10:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
 <175751081352.3667912.274641295097354228.robh@kernel.org>
 <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
 <20250910143618.GA4072335-robh@kernel.org>
 <CAMRc=McKF1O4KmB=LVX=gTvAmKjBC3oAM3BhTkk77U_MXuMJAA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=McKF1O4KmB=LVX=gTvAmKjBC3oAM3BhTkk77U_MXuMJAA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 1WcKPQ-_2aJTi3FJ6438LeT3ozi3H1yT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX+XP/PKglK5vD
 jsPheO2Ji11Q9DnqCv4N7xm8UsgImFIyz3AVWbSm55t3heKlL4PIH2ZitOZfdW887lAFQFYCL7v
 kM7NptkBiUbrY7u3XC79o7Kv/DGTmzrY1Bb+Y7pKyTThE7OWU5tBKoLTmhuDIWxFsuTPNtumF2v
 0ENYX8/UWjn9dT7hoKujqWvNlDHnV1z7/5usjTVkLVb/3dlKk7FSdjhiBxHg7pH7V7Ch/mztuS+
 sAH4Odq8oVgkGkdCLrLEyjBTB7XZlI0EH2giYaSAV8raZMrOCvKd4QI5c5l61BW6FdtzPssEqIe
 Qa8c9alfiepZ3tyq2yHtkh8X1U5iM8KOOe4/X/NTMew6vju5U7iY5CkrlC5jrwYTQlXUYbFgkTT
 YKSNgExQ
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c28e0c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=E8Hth7WlfHmEou41Ml8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 1WcKPQ-_2aJTi3FJ6438LeT3ozi3H1yT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gOS8xMC8yNSA0OjQyIFBNLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+IE9uIFdlZCwg
U2VwIDEwLCAyMDI1IGF0IDQ6MzbigK9QTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3
cm90ZToKPj4KPj4gT24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgMDM6NDM6MzhQTSArMDIwMCwgQmFy
dG9zeiBHb2xhc3pld3NraSB3cm90ZToKPj4+IE9uIFdlZCwgU2VwIDEwLCAyMDI1IGF0IDM6Mzji
gK9QTSBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPj4+Pgo+Pj4+
Cj4+Pj4gT24gV2VkLCAxMCBTZXAgMjAyNSAxMDowNzozOSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPj4+Pj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xh
c3pld3NraUBsaW5hcm8ub3JnPgo+Pj4+Pgo+Pj4+PiBEZXNjcmliZSB0aGUgZmlybXdhcmUtbWFu
YWdlZCB2YXJpYW50IG9mIHRoZSBRQ29tIERlc2lnbldhcmUgTUFDLiBBcyB0aGUKPj4+Pj4gcHJv
cGVydGllcyBoZXJlIGRpZmZlciBhIGxvdCBmcm9tIHRoZSBITE9TLW1hbmFnZWQgdmFyaWFudCwg
bGV0cyBwdXQgaXQKPj4+Pj4gaW4gYSBzZXBhcmF0ZSBmaWxlLgo+Pj4+Pgo+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5v
cmc+Cj4+Pj4+IC0tLQoKWy4uLl0KCj4+PiBUaGVzZSBzZWVtIHRvIGJlIGEgZmFsc2UtcG9zaXRp
dmVzIHRyaWdnZXJlZCBieSBtb2RpZnlpbmcgdGhlCj4+PiBoaWdoLWxldmVsIHNucHMuZHdtYWMu
eWFtbCBmaWxlPwo+Pgo+PiBOby4gWW91IGp1c3QgbWFkZSAzIHBvd2VyLWRvbWFpbnMgcmVxdWly
ZWQgZm9yIGV2ZXJ5b25lLgo+Pgo+IAo+IFdpdGggYSBtYXhJdGVtczogMz8KCkluIHRoZSBjb21t
b24gZGVmaW5pdGlvbjoKCm1pbkl0ZW1zOiBuCm1heEl0ZW1zOiAzCgpJbiB5b3VyIG5ldyBmaWxl
IHRoYXQgaW5jbHVkZXMgdGhlIG1haW4gb25lOgoKcHJvcGVydGllczoKCXBvd2VyLWRvbWFpbnM6
CgkJbWluSXRlbXM6IDMKCktvbnJhZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
