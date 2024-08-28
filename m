Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C22D9962F05
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 19:52:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89E25C6C855;
	Wed, 28 Aug 2024 17:52:32 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57419C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 17:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1724867531; x=1725472331; i=markus.elfring@web.de;
 bh=cWUC/Z3aG3WTiZLoE9HJ1x7Ols2sRq6uGOw77LkVo9U=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=b1jmHD6hIaox9rfvqbbDG+U6TB0MhdO+wgDixGLC7fsPMW1qcJYfRP75b4eIVh55
 jYikd7nQ7NoaWBTNM7d76DnK/oEFXhlPU0u9CfWBKIwGk/bjpu2Ug8hh+qkcZxg5I
 w17mU5DDLatYS3TeW+eje/wC1TJxuhgKJnSh+YWdVXK3Sr2GNbJmlqZIRdeFtpiCO
 0owF0P4yDCDijT5T2YqulQQgY7YgZXjVuCpedGvm0+74A+B9CVMifNdpMCcRHl6YP
 AShNlvw0PiVjl/+XO3I29MxIOqHXumiKZLrLqu8ltdvhjkB+wjpMEydJx4tQvOyV3
 FtoMpoBvnX/fwNvDMg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MODiX-1sTeJ018ob-00Ox9r; Wed, 28
 Aug 2024 19:52:11 +0200
Message-ID: <95cea320-4c47-4399-a615-295fc1129c04@web.de>
Date: Wed, 28 Aug 2024 19:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 James Clark <james.clark@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mike Leach <mike.leach@linaro.org>, Rob Herring <robh@kernel.org>,
 Suzuki Poulouse <suzuki.poulose@arm.com>
References: <20240828012706.543605-5-quic_jiegan@quicinc.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240828012706.543605-5-quic_jiegan@quicinc.com>
X-Provags-ID: V03:K1:B9MR2feQ+JQx+jGIkuoKQcLqjmbU63G9N5x9hY9ft8p2QcpjDGc
 jemUaRSRxROvOWhzJeq1PdJ7QVq5kpFPhngfEeRH7LcRbcL1HMOt6yS21ZvOjhTBBFdmQB3
 PmKQ28Jv76H++NfYkvG0FUkICIPwqKe+dx44zj1hV/03Dt8Os+89C+CDMRQoAGAzkejqrWQ
 kGVHEuY2g7Msio08n1C0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QrupnjinL4M=;McIiekfMC/E/uMXRZiCSjeWhmgZ
 tmBRMk6HspsXsXPcDnSNtWn5P1XNzG8m9BHNolksEbnbGNdpJMMPMTKc1J/4MnxwEpcoiVcjZ
 8PRHgWdzEIpTWyaWYE+gYqA8RAJ9Y4/wxNe4DOWTK3zoaGpsNFSNPFpyFPfVWv+RqqdmqUiCK
 xtIyeKhvBavVbcPpg+RdzovsqXVa2eDwEfFIkPCr9TYUjysdjZ7wIUaZ5rPnQmDCpm8aYNhla
 x/zqsaC/gCDQhV5QbJI/aIVZRslUNMozKVaWwLlLNo4pN/KmWsVpdTY2/0+/VZjb4Wf/OZw9Y
 4lVdv8ziQx29+TA2Y/sI6k2/1DfWNti0ILLhbpIcbw2hzObhovHt3R+TH2stp/tsmtQwvJV1m
 OqYMnNRmBt0yDyJovpEvsUeRlwFBRzeYsN9YCw/mfUeRhAk1VQwrjZ40+eR+JoxRSJ29NdQpm
 E11yDnAggzX252F+Jv6B9W/A0zsOLumm0ZE6E/BVHldeTycMtJJUtYwvW81E46fxB1nFsWr+3
 3weT+X6LUnQHBR+m0aHUHCRMOvUDgYDvurTixm/Fnwb8Vu7obl7YAaq9TdH9rYQWi6xEfDeV4
 Ha84qPlZP/EtQIrwqyi4pdqx2oI6MYVT/L/434YRE1N1vfXiRoPG3aDoJs6o+I/dxMIe1Ds+n
 osk1rmWSX4jAQFzfn2PpzXznffT0Yq9A/JsWTC3be4X0LZd/B6jjzOiUve1v3mOLiQY59MQ8X
 eNl80K4d1Cl3wqemrOeL5UZ6lMP79WaiLECUcDz9hjUYdiINd4GC+4u/bmlzxpWzR9EoEAgiM
 rJqbHb2dLD7S3FryJjFQVSuw==
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>, Song Chai <quic_songchai@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, Tao Zhang <quic_taozha@quicinc.com>
Subject: Re: [Linux-stm32] [PATCH v4 4/5] Coresight: Add Coresight TMC
	Control Unit driver
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

4oCmCj4gKysrIGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGN1LmMK
PiBAQCAtMCwwICsxLDI5MiBAQArigKYKPiArc3RhdGljIGludCBfX2N0Y3Vfc2V0X2V0cl90cmFj
ZWlkKHN0cnVjdCBjb3Jlc2lnaHRfZGV2aWNlICpjc2RldiwKPiArCQkJCSAgdTggdHJhY2VpZCwK
PiArCQkJCSAgaW50IHBvcnRfbnVtLAo+ICsJCQkJICBib29sIGVuYWJsZSkKPiArewrigKYKPiAr
CXNwaW5fbG9ja19pcnFzYXZlKCZkcnZkYXRhLT5zcGluX2xvY2ssIGZsYWdzKTsKPiArCUNTX1VO
TE9DSyhkcnZkYXRhLT5iYXNlKTsK4oCmCj4gKwlDU19MT0NLKGRydmRhdGEtPmJhc2UpOwo+ICsJ
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHJ2ZGF0YS0+c3Bpbl9sb2NrLCBmbGFncyk7Cj4gKwo+
ICsJcmV0dXJuIDA7Cj4gK30K4oCmCgpVbmRlciB3aGljaCBjaXJjdW1zdGFuY2VzIHdvdWxkIHlv
dSBiZWNvbWUgaW50ZXJlc3RlZCB0byBhcHBseSBhIHN0YXRlbWVudApsaWtlIOKAnGd1YXJkKHNw
aW5sb2NrX2lycXNhdmUpKCZkcnZkYXRhLT5zcGluX2xvY2spO+KAnT8KaHR0cHM6Ly9lbGl4aXIu
Ym9vdGxpbi5jb20vbGludXgvdjYuMTEtcmM1L3NvdXJjZS9pbmNsdWRlL2xpbnV4L3NwaW5sb2Nr
LmgjTDU3MgoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
