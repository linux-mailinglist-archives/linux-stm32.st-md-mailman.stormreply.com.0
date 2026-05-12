Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKPkDk3qAmpKygEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 10:52:29 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD91D51D0C7
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 10:52:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AD5DC87EC1;
	Tue, 12 May 2026 08:52:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE98AC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 08:52:27 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64C5HW2c2186992
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 12 May 2026 08:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 53+Ajxm9/zLBxHnAxbEtkpFewtO5WL8IWPxCOpSgNLs=; b=f8+gyyVut5AKopKd
 mSeXPq9Nj3PlBCRZf7BuZy45g7tkwBcu/Rq6OQys8VzEF6OFTqbVtKIcVhLgxW9P
 eukcMCqtmgcuwSEts7+PvyJ8uXDBzzPYvA663cDrguDJ4EJ+lJW3XHRoF3NuE6cq
 fR8BiSXabb8G1rqPKdV7vYN9MsXzv3FdipovBoj2BBnrFYHrBDNUf05y8pBpQLmR
 42DuQ1iwcSxDchhp7pDxWYqaNBb7t1UJTZ4f1oMmS/2BkbabNIkUhSaCDJBZSbb5
 q3Fky4FA9DfuySLnEjo3qd6zxuCKjMXFTD6AmB509wRhvkr69uKLIbXovteDkg0T
 y4opew==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0t8nu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 08:52:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c827c0aac70so1638831a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 01:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778575945; x=1779180745;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=53+Ajxm9/zLBxHnAxbEtkpFewtO5WL8IWPxCOpSgNLs=;
 b=DtayG1njyhi0jx+C9JIGh6CAOfHruZaomKqNjyJbXrPsmwn3YjlJR5j0559x3LR5Xk
 UQrMXgn4ZBYnrVJcYcigLamVGTtlqkcDQZI7OHgPxM0auDYPS1u7isgVrUJhFMgAhbW4
 9YEl4FAnNSuigPU1CcjD3i9IhC53dgtukFGJG0W9CNKLlt3pU1GH03ULQQzBjbL+OImV
 3kcs+juLnjeE5WHy4Gy4vGggzQUH2Odi8z9A8kiXdWA/RjK7e4Trm7gyd8vrOzwvC4+v
 5xvp0mrNxHUluxskNMOinznbK5hH9EpSGBExYDQERb5IK6AiHn8qrGt8hdV07WywDmwd
 yCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778575945; x=1779180745;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=53+Ajxm9/zLBxHnAxbEtkpFewtO5WL8IWPxCOpSgNLs=;
 b=NQSND/3Xh1zC9qWKG3kGPBoOC48cFjaB36akzICsW+FIGUb1JExYyYPbW4jP06GT+e
 1U6R6Em4J1DzQGYoaNWd1jY26pvdbpA8DBFU4mA6vHe0qprAcFyI2IHj9CepLA+z+DBv
 DmMMykrJTVFreUPMSFunbqrvK7oAw7ZWmJEDmFVJkS2J6/ctZOFL0QChnxrloKVKvTvq
 RE7DBQWZMJ3MyrEN3avkr+MvVGCTomNntxVpj6STFZKY+/uMTPXg2N8D5q/KJAifyr81
 /Q4YL2SPDSSqSxxWw7xxiWAeOwFx8Jlg569qrp6DCUUljxIhxQIqi7xwRgKDPFX5xOb8
 h2+Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9JjpnyKxPlhFfSc+Oaoo1o7QbcFEtHnqo2UU2uCELI9X4BxD2+G80aygZSI4l0jnmn3s/a/4tNpmd9+A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyOSs32DpeLIOkHGrF8ngyMAkVVbBIDAR57jhDUIKEWpYAH3rCF
 O4Ar4LL5QX4fKF36fxyRGgX7+kLHh04yKoVGxONZ9PpoUb0iX/4r9KYJqY32yCamH9m6VoyDOAC
 Yww/Qr2x605P4kaXc2XIhrbE2pEAyPZL0tUDZWC7Oc7Nc17VNdQWJsWgbXrUaCvvNuVMgslP0MV
 nUtrQ0kSA=
X-Gm-Gg: Acq92OFMvc85ilYbhTII3egi/FdLepX6dlmKofAExqTo42jnyIpISpLt8WYdT8xENzJ
 rOuUqUtK80rpJK56os7nI9LvXrAe6+LpaDEvr/P79yiywTjICdgJv+2/XXXJ+YTwCY2xWLC5k3I
 xx7TVPLqWTUShXsucBZ8KfDVTy1gdU+flSc3Ity5m2yu57CpMOHqlfTRdiqqqEXn7gzm3MlEG6P
 rDeGrzAQs0chIXpm/xWLxR4nl0et47aQExT0O2MHMdJYOxAzGMaL/h2kxs6Ifbc3Bw8Z0D6XwYc
 FrYpVllSXl41o5odFgYPM364HLtAhAAAofW4guEZnstAajOy17iKADJ6MsDu7NvVajWa9lqHy6H
 FiJNoyLpi728n3n0ONZjSkZuVzLM2bB6ndUK208MA924k+qgZ
X-Received: by 2002:a05:6a20:258f:b0:3a3:21db:8ecb with SMTP id
 adf61e73a8af0-3acd4280430mr3012146637.14.1778575945184; 
 Tue, 12 May 2026 01:52:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:258f:b0:3a3:21db:8ecb with SMTP id
 adf61e73a8af0-3acd4280430mr3012121637.14.1778575944726; 
 Tue, 12 May 2026 01:52:24 -0700 (PDT)
Received: from [10.217.217.99] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c8267688e2esm11432629a12.8.2026.05.12.01.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 01:52:24 -0700 (PDT)
Message-ID: <f649f4a8-df16-4fed-b1ca-4362680252a4@oss.qualcomm.com>
Date: Tue, 12 May 2026 14:22:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan O'Donoghue <bod@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
 <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
 <Z8a4y73p6MgF8gQkVtottkgG2Ok8-Vhm8zzckWEbiU_DUO84x2VlwPt-VBL2g0utw3ZwZK0aUvI4ev-p_YRGoQ==@protonmail.internalid>
 <328b388c-438e-4f91-9384-0dad903355a5@oss.qualcomm.com>
 <b280ad04-d4ae-4904-9e99-3d057e3d221b@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <b280ad04-d4ae-4904-9e99-3d057e3d221b@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4OSBTYWx0ZWRfX9uOJHeYYWpJX
 X3noHnboH0Yr35rK8cJYTD4fFVNz71bgpET4gAX9vG/JMzr1SbvK+CLmBZgd/adQPgfyUaYZMVe
 21l5WkcjQ8Plrp4+3Q7aV3AXZIneQcr8fFMBM0D0SsVNGbzIidn7bTxf2zvP2M7kEy89u6k0lD3
 Mc0MtIvYm/YY13lLg7txJ+pTboZ8uJJWNejAPv1TgKj53psjRjAiE3TA9ah3TPlNbr61FDfTTTl
 ESFh+RcACuFxksDwfOURRUZFlll5+h1pHQ0UsoPUgHcXQ8T7CS3LAeqKKFpZdmn8tdpNzzpHquW
 SuEe3y2hpHjZHAdgz1RH6n/UjnnqBMd6AaOiq3HyyZZh60pqPRCi5AePrgrI7fhBOH2mwgp6X0J
 LF42UII+kG9YnsBPIjgY2kB37QbPxLmiZGXn3Mxr4OlZJSenmdTHrJadbCePKq4hdz1PPB/kM48
 L+wBM9YN5Rkz4E3FxDQ==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a02ea49 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=UOnGL9-HqUUrvkLjBzwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: ImI2bNRJcRljZXbltRZbW2vRNNNroaii
X-Proofpoint-ORIG-GUID: ImI2bNRJcRljZXbltRZbW2vRNNNroaii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120089
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 8/8] arm64: dts: qcom: eliza: Add
 support for MM clock controllers
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
X-Rspamd-Queue-Id: BD91D51D0C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.238];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

CgpPbiA0LzEwLzIwMjYgMTo1NiBQTSwgQnJ5YW4gTydEb25vZ2h1ZSB3cm90ZToKPiBPbiAxMC8w
NC8yMDI2IDA0OjU1LCBUYW5peWEgRGFzIHdyb3RlOgo+Pj4gV2h5IGRvIHRoZXNlIHR3byBjb250
cm9sbGVycyBoYXZlIG5vIHBvd2VyLWRvbWFpbnMgPwo+PiBCcnlhbiwgb24gRWxpemEgdGhlIHZp
ZGVvY2MgYW5kIGNhbWNjIGFyZSBjb25uZWN0ZWQgb24gQ1ggYW5kIE1YQS4KPiAKPiBTaG91bGRu
J3QgeW91IGF0IGxlYXN0IGhhdmU6Cj4gCj4gcG93ZXItZG9tYWlucyA9IDwmcnBtaHBkIFJQTUhQ
RF9DWD4gPwo+IAo+IEFuZCBldmVuCj4gCj4gcG93ZXItZG9tYWlucyA9IDwmcnBtaHBkIFJQTUhQ
RF9NWD4sCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmcnBtaHBkIFJQTUhQRF9D
WD47Cj4gcG93ZXItZG9tYWluLW5hbWVzID0gIm14IiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICJjeCI7Cj4gCj4gS29ucmFkJ3Mgc3VnZ2VzdGlvbiB0byBtZSB3
YXMgdGhhdCBNWEEgc2hvdWxkIGhhdmUgYSB2b3RlIGluIG15IENTSVBIWQo+IHNlcmllcyBJIHRo
aW5rIGhlIGFuZCBKYWdhZGVlc2ggZGlzY3Vzc2VkIGl0IGJ1dCBJJ20gbm90IHN1cmUgaWYgdGhl
eQo+IF9jb25jbHVkZWRfIHdoYXQgd2FzIHRoZSByaWdodCB0aGluZyB0byBkby4KPiAKPiBSaWdo
dCBub3cgSSdtIHJlcHJlc2VudGluZyB0aGUgZGVwZW5kZW5jeS4gTVhBIGlzIGFsd2F5cyBvbiAu
Li4gYW5kCj4gdGhlcmUncyBub3RoaW5nIHRvIGRvIHZvdGluZyBmb3IgaXQgQCBNWCA/Cj4gCgpU
aGUgY2xvY2sgY29udHJvbGxlciBkcml2ZXJzIG9ubHkgcmVxdWVzdCB0aGUgbWluaW11bSBvcGVy
YXRpbmcgbGV2ZWwKZm9yIHRoZSBwb3dlciBkb21haW5zLiBTaW5jZSB0aGUgY3ggYW5kIG14IHJh
aWxzIGFyZSBhbHJlYWR5IGF0IHRoZQptaW5pbXVtIG9wZXJhdGluZyBsZXZlbCB3aGVuIEFQUFMg
aXMgYWN0aXZlLCBleHBsaWNpdCB2b3RpbmcgZm9yIHRoZXNlCnBvd2VyIGRvbWFpbnMgaXMgbm90
IHJlcXVpcmVkIGZyb20gY2FtY2MuCgotLSAKVGhhbmtzLApUYW5peWEgRGFzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
