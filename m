Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E27E1862740
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Feb 2024 21:10:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 913ACC6B47E;
	Sat, 24 Feb 2024 20:10:11 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D6FCC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Feb 2024 20:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1708805383; x=1709410183; i=markus.elfring@web.de;
 bh=yLz7Vg77PB7IlV1AITmSO9pNNY8zgh7ejy/6z5+C0lo=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
 In-Reply-To;
 b=cz6rsbiCBDHMcTQ84gLSFbavYUFXrrHjPffNe+PqE6H+aPSS3VNKsrwqPFruBdRO
 vY+IyeQtkL5kds1aFXjwb/feb1g1khvjO57Lf02k7YLNmXBwTBkYbfOl7lejf61Mz
 2T+0aVUoxrrU8jo7V7qUuu80DQyXC+dcgU0EuXkeNRzfMOYNuEHAc6e3xt1GNm+oV
 x6AwWedKOcqg6TnRaLmT4s8EMp54UWR9nXqXM854ojIF/EqhKUL4re+MYvimRs8Ic
 9Z7//KsF7T7sW+7KlqLJyiIOUmtVysMDGcyQwl8HsCvdQIJUxpsY+8AADwh5hTH3y
 q8nBNxC91K97VdWHBA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MkElP-1rBoP0152X-00ka9U; Sat, 24
 Feb 2024 21:09:43 +0100
Message-ID: <0f25b520-563c-4b3b-96cd-d1dcc7ea6f40@web.de>
Date: Sat, 24 Feb 2024 21:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Lechner <dlechner@baylibre.com>, linux-spi@vger.kernel.org,
 linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Mark Brown <broonie@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20240219-mainline-spi-precook-message-v2-1-4a762c6701b9@baylibre.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240219-mainline-spi-precook-message-v2-1-4a762c6701b9@baylibre.com>
X-Provags-ID: V03:K1:KmuGeYS0ux4JU6O/o1Nu+42F6g71tHr+fv4Cdf5CuQtvKg1uvSg
 vjYqz61D7ymrpo994E5hjD1PvjDRPtvAwNo4ABW+RoF6DWx1XWXdjexrxQauqSgPlIiKbo3
 nRHW4A+GgRRwZp6WbEM7VuOXok/HOHsz2z1MMcumnqxMuE6AJtwolCKp6PbYWs5E8s6iVYP
 9jaJaK9mvtvBHtKRt3VBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rs8ApOkw4n0=;kKElr7kdlqMFdGj4Ytt69yAWBfV
 j/SWK+ut/QxX+wxw+Wc+wCxQQQPSRP1sguIrGT2PLFo/uqQMmhbGugP73ZyqD5AZ8EvzO/SHR
 lwmZp8PTm19zu0vKpgaB9AXnAtTs2UgB1ijFbHJ/fiGT5lCui1lF8PpG0loy8CwgzjAzACi65
 qnw5M0XUxJzeUoUIcWahISrS9b7s+r3y2K0UBvoeXswFzlhW1P6WDk9FBfckqzKttJt84N6sL
 vtDBVQoOhejDkKIx3g0f8bxw/PUhaEEktKsZGDkYrlgLnL/E8vKzVfR3ZUTfOa1cEd/kqHEdG
 ueZTVDhDLRChWtMUcawTrx5+ko1chWs+Rc3halO4cDlzirRHC6ecyJWIl4JrOwr5zHdgaWRzs
 QSR2DQlsWC2AvKSW5E+ZpAEtSnjyWulFo+qgtGeM83vpXP5ZlG6n/O449N2QAaiwIjZAhgCWL
 /yGvDQO0mexGUIAH1wjK3wOyJAac/FA/J0MmYstkj5MC9V51HLs4cCs3dCwIcJt5+cD6Yr4M2
 t1BqtohPSJqOVy1x0rIcq8ZpRQ+u9P7sPrRMdmN0/TgBy8bWCWqEeoqJyhPiKVsIIWi2PK+zK
 q+MA7CUX+oXoxu8OuLAvRA/BpJQSEg5MrxvvBTNExIkt47LiQmz7Ey4pUSstYUaS32QPemQpH
 WNY4dgNLO+wGa9xd9IGS68p8R2ah7yBCQd9N3ywueSraPjhZI3eCXEDiTSnQo4zhAVQa5kjlS
 WVPjOGheQintX/p1rORFyPfJHLvALtVhRfzH/QjzcrPQ4WPcFfAERXVdZDw18rk3CIklxh7qM
 G7vz62U3ZpEVrjqoLcYNtqw9mRRdDUAfT5ZmCYdw41mik=
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 David Jander <david@protonic.nl>, LKML <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Sperl <kernel@martin.sperl.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/5] spi: add spi_optimize_message()
	APIs
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

4oCmCj4gKysrIGIvZHJpdmVycy9zcGkvc3BpLmMK4oCmCj4gK3N0YXRpYyBpbnQgX19zcGlfb3B0
aW1pemVfbWVzc2FnZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpLAo+ICsJCQkJICBzdHJ1Y3Qgc3Bp
X21lc3NhZ2UgKm1zZykK4oCmCgpJIHByb3Bvc2UgdG8gcmVjb25zaWRlciB0aGUgdXNhZ2Ugb2Yg
bGVhZGluZyB1bmRlcnNjb3JlcyBpbiBzdWNoIGlkZW50aWZpZXJzLgoKU2VlIGFsc286Cmh0dHBz
Oi8vd2lraS5zZWkuY211LmVkdS9jb25mbHVlbmNlL2Rpc3BsYXkvYy9EQ0wzNy1DLitEbytub3Qr
ZGVjbGFyZStvcitkZWZpbmUrYStyZXNlcnZlZCtpZGVudGlmaWVyCgpSZWdhcmRzLApNYXJrdXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
