Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19944910A9E
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 17:49:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF949C7128D;
	Thu, 20 Jun 2024 15:49:23 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 031A3C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 15:49:15 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7eb7bf1357cso33624439f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718898555; x=1719503355;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gij+pTTJKVdo/dX5mfK2/SDWcBCb/yTF0kB7stawEoI=;
 b=C8rsJzyh2+YCFLc+qDdbdP9tyjBd9M5oQmoZiXMk4DdpUc6zqL49POAXuRiNeQ7gnz
 G3mtRSfB+zMMB8bGNpxr80WE+NrEAUEE92Y40QASFz96p3/DUw/ThsCgKGu3jY6SduD/
 CldE8VLQzi4aJ2hRkPlnOSmPXI9Xh7qGBaiXCjOI3/RUpKuuNaaIZ79pK/AVUuL0HUYs
 Xy6jvd905Gk05ATKCI4k4fvkoZInb6BSP+0ux010TN0GhCpnJgEAZMdpReTVYvbPpSc6
 zjh/EINrDzv8MyolWWafTksYbaQ43vi84OmeeERzHJ9lAZq6Fp5NKkEUfTXXuZCuvrS5
 gaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898555; x=1719503355;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gij+pTTJKVdo/dX5mfK2/SDWcBCb/yTF0kB7stawEoI=;
 b=sG3FMBVRJC1d+9x5PmIf7gqKwK0es967SK2vLRdE6sCkh/Y9a0ofX7flp6+oe+syCQ
 HR3ve4zkzvbnlNsN0OAeJ0fPUZi7lC8MTe5eHnKtvMCBzDIAwSLCNUhtxsEqgFS30upU
 Kejuf8ws2p7lp5ZMYCSOxySMVbzabGYT4LgklrdKmC25amX8uH2lmEYuKGRr/QVCbVgk
 BNFOcHkZ/QsNb8R6Paj6MR9YKhhJlqGBFj76cgK21jZDOoOdMoCnzbNlNnD6PkWiJChZ
 Ktqgxis8E5hMBg2rBZoUhepbCAiENuUZcbt78qwMQ98lvmZEsw4emBxwoER0QYgFhK+L
 gKMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyeaSFE1u08mN0B76688UBNOGhMnFAWytw4O29hpYFC1LT7nAuM94uD9kUQLF7Fh/3Dwz8fB3x1wXFLB6NpMsoyFMR3/k9gRnYGSP4zAVD0XFExAyGY4/H
X-Gm-Message-State: AOJu0YwnFZk1r5KkomSKXXUwwuTpv0Zm6qRs2NyMVPEPk0AYt0IRrerY
 PWQ1LkKu/hRzR9faQ3v1e0UyHLMtw3VZe1nROAyYlPsKb5p4rqAoZJ4YjPX3/Qs=
X-Google-Smtp-Source: AGHT+IFGsKmMIaoucA4mUEkbCmj9WXbIfYXFvOKziux2p6zWcz46+4yA+IfWB+ZbVwEcfz4/SgbukA==
X-Received: by 2002:a05:6602:1615:b0:7eb:dc70:979c with SMTP id
 ca18e2360f4ac-7f13ee9e805mr622617539f.21.1718898554795; 
 Thu, 20 Jun 2024 08:49:14 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4b95696daa4sm4559586173.81.2024.06.20.08.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 08:49:14 -0700 (PDT)
Message-ID: <51f2a61d-dd52-49d7-a5a0-f20a5b0c8a58@baylibre.com>
Date: Thu, 20 Jun 2024 11:49:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Lee Jones <lee@kernel.org>,
 Thierry Reding <treding@nvidia.com>
References: <cover.1718788826.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <cover.1718788826.git.u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/2] pwm: stm32: Two fixes
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

Ck9uIDIwMjQtMDYtMTkgNToyNiBhLm0uLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxs
bywKPgo+IHRoaXMgc2VyaWVzIGNvbnRhaW5zIHR3byBmaXhlcyBmb3IgdGhlIC5hcHBseSgpIGNh
bGxiYWNrIHdoZXJlIGJvZ291cwo+IHBlcmlvZHMgd2VyZSBjYWxjdWxhdGVkLgo+Cj4gSSBpbnRl
bmQgdG8gc2VuZCB0aGVzZSB0byBMaW51cyBiZWZvcmUgdjYuMTAsIHNvIHBsZWFzZSBpZiB5b3Ug
aGF2ZQo+IGNvbmNlcm5zIGRvbid0IGhlc2l0YXRlIHRvIGV4cHJlc3MgdGhlbS4KUmV2aWV3ZWQt
Ynk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Cj4KPiBCZXN0IHJlZ2Fy
ZHMKPiBVd2UKPgo+IFV3ZSBLbGVpbmUtS8O2bmlnICgyKToKPiAgICBwd206IHN0bTMyOiBSZWZ1
c2UgdG9vIHNtYWxsIHBlcmlvZCByZXF1ZXN0cwo+ICAgIHB3bTogc3RtMzI6IEZpeCBjYWxjdWxh
dGlvbiBvZiBwcmVzY2FsZXIKPgo+ICAgZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgfCAxOSArKysr
KysrKysrKysrKy0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKPgo+IGJhc2UtY29tbWl0OiAxNjEzZTYwNGRmMGNkMzU5Y2YyYTdmYmQ5YmU3
YTBiY2ZhY2ZhYmQwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
