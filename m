Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4322B2D748
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Aug 2025 10:57:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08FAFC36B3E;
	Wed, 20 Aug 2025 08:57:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1D59C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 08:57:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1pAtY021351
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 20 Aug 2025 08:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LovUKZUetKjTNqClYAkifuYXcchuuq2HOA0oOrFjetc=; b=epGuVVM3UEI+lpZ/
 GC3Gd49RLBjAts2KljoWNXZv1cVr+p/JIiFOTIni5sidKUiq8KP1lK9EODITlCKG
 do4i2ykChgNg+ODHLRPgfw/2uxIGrXvNag/dnw8nYBPZuadkJTjWfKqS2dEimX90
 VRxYcJHdH05LPhJCJKGZO3UvNU1hSJuditpdj8qQ4KkvscAWFiu7us+ZcZXANkYR
 oz/G+N7ALaYxtAwMeJeLgaOiiCtCrS7HX5rVM8sqc0Ju79vTt55maIT7bY9nf4we
 UnO0zqkurPhJR05+67EV2d164UT/MeAXMSDTmXfLQXtwX6WQKJgaAL+ChW0EZFrk
 DMzOVA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52912pd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 08:57:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24457efb475so72910885ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 01:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755680267; x=1756285067;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LovUKZUetKjTNqClYAkifuYXcchuuq2HOA0oOrFjetc=;
 b=ngQQktKUCH9/Hr5u8iZVNLTsU4Ui+gAjjEVhu7TLWbOht3v32tpBD1wJ3kYw4/kwb+
 fKIepuodkTKjJVXkvQcddYw6SspAyCKEgWaIEVctubFSzBvjYnlB1OKvijvAY5lTAMke
 Xfba1ZGYn94pCGoce/zZzwlad3clJ2ZYADD7cNXF8c9a9uhru90jVY3lMjSx+eXI7GCy
 jkTZUhPy02Gqp1v7bZYyXLbx1eiYWKdS9eJxz+NQ7bvf95s5nBEEtp93raRzY2xMrTTJ
 VtKzPVfnw0tYXLmsc0eSTzycH95w8ejBId9290XlvUWsNRy8r2+6CIbY3mz3MGgQ5u2a
 inJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe4mK2wWcJvBMXFNT6JxML3fTdeS/0mvSUurSfilxQynBIDreB0MgE1nWGRfUocH2noFi8dE1oX2BAyA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxbVPj6HXXWZPmXaBJ6Ychcafai7CdYSMA8pe6qOs72y2ZNvgIZ
 ZYRaZ5meMGWu405hoYBZdvPgzpqotrUQRyJN01ioiqvd+FH9h+pZ0dYK2eKLZ70RUbeVhXjrAvG
 l03kQk2HKx0VGoN9ACkXhfI2FE/sltsf+vy0ctT69zaIZcDz2w+nEDqn2XItYYRl6sYpRLMKozq
 vN0RrBuqA=
X-Gm-Gg: ASbGncsY+ggYbCUdMz6UxfXN+WVAM2d3J1fAHTBpdA9b+5kh1EJcWLMWLpb5NiGAoJD
 3wtCWjVJzJAoGfedGfzDSxdRKZ3Jk5CGg/GOBqyVmqad/CtdoI7YgNYlsJ0rg221RnEjkvKfvpI
 HRwWpMGTWTEmHdu97DmlfVyH44GTKsWUj7AmS+DW7wOoNYeeO+vgZH2rjSUF3t6+m+y+9NDBlyI
 7Ig0VQTLXB2g4T2Jfm5rlV2FwmL4mCRlOg1Xy1Y70voOyqZo9v/zXp38V2tWBLoKeSkHcV24F73
 0s++5VdE4IUfMyzu4R1SYXhdYtfi2s2fnYpjWzorttlw0zVjUpAfTB/AitpDCJu8BC0J1JVA5o6
 6pflZNvkrE5HoJRrJnrAx6E/kPag/xoAC
X-Received: by 2002:a17:902:e74a:b0:240:96a:b812 with SMTP id
 d9443c01a7336-245ef1728ddmr29790175ad.24.1755680267117; 
 Wed, 20 Aug 2025 01:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5sQXiIDgpXrdgQJsAaziiWnOkOwfxl+Waxq3t4y+pSVqgHGK5588qw9DsrKpoU1yq0lXcog==
X-Received: by 2002:a17:902:e74a:b0:240:96a:b812 with SMTP id
 d9443c01a7336-245ef1728ddmr29789735ad.24.1755680266607; 
 Wed, 20 Aug 2025 01:57:46 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed379e92sm20242905ad.65.2025.08.20.01.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Aug 2025 01:57:46 -0700 (PDT)
Message-ID: <b1eb2ed6-9743-465e-9b2e-75d5a06c1497@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 16:57:38 +0800
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
 <1394aa43-3edc-4ed5-9662-43d98bf8d85f@oss.qualcomm.com>
 <7c072b63-f4ff-4d7f-b71e-01f239f6b465@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <7c072b63-f4ff-4d7f-b71e-01f239f6b465@kernel.org>
X-Proofpoint-GUID: SWlvyKC-5AveUM1_f4SKWNWonVW5-wHm
X-Proofpoint-ORIG-GUID: SWlvyKC-5AveUM1_f4SKWNWonVW5-wHm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2a1of/5+QCjy
 xVIxRgZNHIcQZfwcMgEyRztzFVRkyKZgfoZGb/+116EJyW62GiD39b6ANmZ8At2NSsghoVb9B6z
 8mgZIy2d364T6LbTe3amP7jsg1CHmo3LCEcdgv7ayrWr9f62UEeI7I+oLw6DZNdUCgYOdwTS2Na
 9PGntxQYEADKXJhwTT4HsHisQTnewazbQlwskB3NEI2miVbYa+HELfZKVhVBM6nIEu5W12AHf6T
 sZ72RGH2CpE5VEZJQY3zMw9wXCSOon4K9dGzXbK2Vgs73QhMMFw5Gb4EDc+Z0zagRrpdJOoGmf5
 ocLzIfWWKuqXzh8qt1U0JDUzVJfWLWNPDrgskMc2R9EcpwUUa0+XZEXTc5QktkrSnpfzjJgAyr8
 U/GpS6fWN3dXcBsCmgR0bgTYVSqWGg==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a58e0c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DOxB7AakEuovRElI8tQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

CgpPbiAyMDI1LTA4LTE5IDE3OjA4LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDE5
LzA4LzIwMjUgMTE6MDQsIFlpamllIFlhbmcgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDIwMjUtMDgtMTkg
MTU6MTUsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+PiBPbiAxOS8wOC8yMDI1IDA4OjUx
LCBZaWppZSBZYW5nIHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+PiBPbiAyMDI1LTA4LTE5IDE0OjQ0LCBL
cnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+PiBPbiAxOS8wOC8yMDI1IDA4OjM1LCBZaWpp
ZVlhbmcgd3JvdGU6Cj4+Pj4+PiBGcm9tOiBZaWppZSBZYW5nIDxxdWljX3lpaml5YW5nQHF1aWNp
bmMuY29tPgo+Pj4+Pj4KPj4+Pj4+IEFkZCBhbiBldGhlcm5ldCBjb250cm9sbGVyIG5vZGUgZm9y
IFFDUzYxNSBTb0MgdG8gZW5hYmxlIGV0aGVybmV0Cj4+Pj4+PiBmdW5jdGlvbmFsaXR5Lgo+Pj4+
Pj4KPj4+Pj4+IFJldmlld2VkLWJ5OiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQG9zcy5x
dWFsY29tbS5jb20+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZaWppZSBZYW5nIDxxdWljX3lpaml5
YW5nQHF1aWNpbmMuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+Cj4+Pj4+Cj4+Pj4+IFdoeSBkbyB5b3Ug
bWl4IHVwIERUUyBhbmQgbmV0LW5leHQgcGF0Y2hlcz8gVGhpcyBvbmx5IG1ha2VzIGRpZmZpY3Vs
dCB0bwo+Pj4+PiBhcHBseSBpdCwgZm9yIG5vIGJlbmVmaXRzLgo+Pj4+Cj4+Pj4gVGhlIERUUyBj
aGFuZ2VzIGFuZCBkcml2ZXIgY29kZSBtb2RpZmljYXRpb25zIHdvcmsgdG9nZXRoZXIgdG8gYWNo
aWV2ZSBhCj4+Pj4gc2luZ2xlIHB1cnBvc2UsIHNvIEkgaW5jbHVkZWQgdGhlbSBpbiBvbmUgcGF0
Y2ggc2VyaWVzLiBTaG91bGQgSQo+Pj4+IGNvbnNpZGVyIHNwbGl0dGluZyB0aGVtIGludG8gdHdv
IHNlcGFyYXRlIHNlcmllcz8KPj4+IE9mIGNvdXJzZSB5ZXMuIFlvdSBhcmUganVzdCBtYWtpbmcg
ZGlmZmljdWx0IHRvIGFwcGx5IHRoaXMuIFBhdGNoZXMgYXJlCj4+PiBjb21wbGV0ZWx5IGluZGVw
ZW5kZW50IGFuZCBldmVuIHlvdXIgaW50ZXJuYWwgZ3VpZGVsaW5lIGFza3MgdG8gTk9UCj4+PiBj
b21iaW5lIGluZGVwZW5kZW50IHBhdGNoZXMuCj4+Cj4+IFRoZSBjaGFsbGVuZ2Ugd2l0aCBzcGxp
dHRpbmcgdGhpcyBzZXJpZXMgbGllcyBpbiB0aGUgZmFjdCB0aGF0IGl0Cj4+IGF0dGVtcHRzIHRv
IHJldmVyc2UgdGhlIGluY29ycmVjdCBzZW1hbnRpY3Mgb2YgcGh5LW1vZGUgaW4gYm90aCB0aGUK
Pj4gZHJpdmVyIGNvZGUgYW5kIHRoZSBkZXZpY2UgdHJlZS4gU2VsZWN0aW5nIG9ubHkgcGFydCBv
ZiB0aGUgc2VyaWVzIHdvdWxkCj4+IGJyZWFrIEV0aGVybmV0IGZ1bmN0aW9uYWxpdHkgb24gYm90
aCBib2FyZHMuCj4gCj4gQW5kIHdoZXJlIGRpZCB5b3UgZXhwbGFpbiB0aGF0PyBBbnl3YXksIHlv
dSBkaWQgbm90IGFjaGlldmUgeW91ciBnb2FsLAo+IGJlY2F1c2UgeW91IGJyb2tlIHRoZSBib2Fy
ZHMgc3RpbGwuCj4gCj4gWW91ciBwYXRjaHNldCBpcyBub3QgYmlzZWN0YWJsZSBhbmQgZG9lcyBu
b3QgZm9sbG93IHN0YW5kYXJkIHN1Ym1pc3Npb24KPiBndWlkZWxpbmVzLiBEVFMgaXMgYWx3YXlz
IGluZGVwZW5kZW50LCBwbGVhc2UgcmVhZCBjYXJlZnVsbHkgdGhlIGRvY3MuCgpUaGUgYXBwcm9h
Y2ggSSdtIHRha2luZyB3aWxsIGluZXZpdGFibHkgbWFrZSB0aGUgc2VyaWVzIG5vbi1iaXNlY3Rh
YmxlLCAKYnV0IEknbGwgY2xlYXJseSBub3RlIHRoaXMgaW4gdGhlIGNvdmVyIGxldHRlciBpbiB0
aGUgbmV4dCByZXZpc2lvbi4KCj4gCj4+Cj4+IEFzIHlvdSBjYW4gc2VlLCBJ4oCZdmUgQ0PigJlk
IG5vYXV0b3NlbCB0byBwcmV2ZW50IHRoaXMgaXNzdWUuIEdpdmVuIHRoZQo+PiBjaXJjdW1zdGFu
Y2VzLCBJ4oCZbSB3b25kZXJpbmcgaWYgaXQgd291bGQgYmUgYWNjZXB0YWJsZSB0byBsZWF2ZSB0
aGUKPj4gc2VyaWVzIGFzLWlzPwo+IAo+IE5BSy4gU25lYWtpbmcgRFRTIGludG8gbmV0LW5leHQg
aXMgbm90IGFjY2VwdGFibGUuCgpPa2F5LCBJ4oCZbGwgc3BsaXQgdGhpcyBzZXJpZXMgaW4gdGhl
IG5leHQgcmV2aXNpb24uCgo+IAo+IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCi0tIApC
ZXN0IFJlZ2FyZHMsCllpamllCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
