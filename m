Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3D08626A5
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Feb 2024 19:16:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C21E0C6B47E;
	Sat, 24 Feb 2024 18:16:03 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14597C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Feb 2024 18:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1708798541; x=1709403341; i=markus.elfring@web.de;
 bh=VUx1i8XWpfeim7DHTmTo7nDlWrnG/F3najnDhzFbEu0=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
 In-Reply-To;
 b=obqcXRK3l8/f6gVhd0guF3S8rwmabTEE1NwgSuP3x5HBGyMvteRhIfn79357pqC6
 beBKWNt9zzMUNAipF1WNf/uYEPDiFI0b3HVNH4Y3VdhvEf23VnX8JfVz4z95TqINf
 mqV7VZgp0wacpZE3x4dJTp0IzFO197JRk6mIMrRUiF7RMGSpD5aq2sJwHQ+8My92X
 IF8sTfEjrjbgub1/48bqoxm8TUIRznKJT5WtUQZvCXWctGEEL0NxoRhutUl2r+IwD
 0b/73Y4wlYDuQSbc3mtNFBaKl2l8Z31n/Tb+4jVVAi96ksXGWOpRWpdzl63Tvc3w5
 fhGzhYMwM5xZ5YI3Hg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M7epr-1rYiQq2PiX-008CCk; Sat, 24
 Feb 2024 19:15:41 +0100
Message-ID: <80b1afef-3502-4719-ba9d-682b5566688b@web.de>
Date: Sat, 24 Feb 2024 19:15:31 +0100
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
X-Provags-ID: V03:K1:PDatmO5YnLqX8lT6ygw7MPKZXfWiMCjg+ZexIiXGIK3wvR8lKMV
 /D3tyZEGXNWGy+CM+nkgcUpjdTYfgURdM/7+bewmaixJqJJgLgWI5zi8O8NXfQ9AdFgo9ta
 JdqGnsqs4kbLdMlyl8QifRHdNHSO1yLeFJV+TpuyrVUjGrYyTcIQHXXPgJ6TaS5p1tsdTVR
 927Io9MXhIa5fOxDVxJlg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3cS0VhBImIU=;bnuscn4tw449kz9nyq0ezwz1zYn
 znvFq8A809Mc1Ko/3CjdxpWOQYyGmzXkIu1yx+oyng4uHcin/fqlbDZsJmxY17tQQ+tV4uplU
 DGI4py1z3E1S/kJeloswIzeDmoj3o7rfhStWl8DhZzCh9hdAkcujgskHxJRbNBYkgfrefCtaM
 qKX6jKU6hRB4v5b6dG8pNzN+UuptzpKLvFg8GhNnKkfwB+Hr5RxX29Aqulfp59tRvHiv6/CQx
 HNshIcIpVwLvuIhIU5ssSkNnp64QS4+iO0p812r/689a12jgh87qQ1ww5n4PJxvmSKKdAwFbo
 Kh7dUpjrWpaOUC/mQBzgTkLw9hO9eJwQW2mBzqucVitxho5fc96zZkosMElSBLIUnz5bEAeEN
 9qRh2AEaYlz/lXEum+vZMBFa6MQtfYp1DFmRhHxjo3o0JDNZHAw1HvljZyTKATGh+MpnmWpiP
 I/xg5jwrggf0oXtRnZBKusYWCtS7AdyjIqetIAl5s1p/kUOR/7AfyYvtabhQOWyKG/zPvJC7S
 PsUdKuxh9fCvnsq0lZziEo3Nz8uQOGdiK2kyD9r09dwxQ7X10mqofUnqD9nAvYuM7/qiHVt9s
 IuHe8xojX7X+os3dauybB5/fzj6sjYSA4zkMPDHlzWgbFvC1cbTTn9SVNek7ke/IHc0cSuEfh
 luwKT1yO8U6+3stJ6ftbp756hIcP0wx3lcqwJ+2qsEy9lHRz/l6wGBIJ4gsPsfUX9DWBofvPT
 afY6uvZdrqUCVeXnzTTf7/k1YUW1SXDWkh+ZpSIChGdXfjDAIkVuiEmrHNAM+OwPZjPh61KtZ
 nVd0zyKylIJotK6myJI818B2cn880ihp/1IP37EwCMjY0=
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

PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICDigKYgY2FsbCBpdC4g
VGhpcyBpcyBkb25lIHRvIHNvCj4gdGhhdCBjb250cm9sbGVyIGRyaXZlcnMg4oCmCgpJIGhvcGUg
dGhhdCBzdWNoIGEgd29yZGluZyB3aWxsIGJlIGltcHJvdmVkIGZvciB0aGUgZmluYWwgY2hhbmdl
IGRlc2NyaXB0aW9uLgoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
