Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 857E9435EE4
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Oct 2021 12:19:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35A0FC5C854;
	Thu, 21 Oct 2021 10:19:30 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16F40C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Oct 2021 10:19:26 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id y3so307079wrl.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Oct 2021 03:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=HcuIt7/7PaI53mxMN1zYIYC7d3hS/MtLZOfEoIwhomI=;
 b=cL/9bzy7HR6WRfHYo7K1Fxw4FWYZhPptGiCRn9fQERQ4E0r+/+p0LuezBf2VkADPUY
 3dmBZhv6nJBirFy27vmSGfZWq6xfmWBKK4ZyQrJZqrm1zloSDLB3iUZhs1n0p4jyWKq9
 4nEr2tvsPKi+eixU1hq0h8c+qjCVdpH7eC7ib0AsGB3fXtmeYAXWAP5g9hY34IU20SWc
 js/q31V29Z/dWp+IA8snrIALGSidN/oOX/umonuc2KHsKRiHJvciAjDhrvKL6nBEivKY
 gFQn0IyFdqSfgdyb7nFl9luDb/XKh91MiGnvdgkG8hVkggSZRH9X3KsiwTe6hsPlLt4e
 DIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HcuIt7/7PaI53mxMN1zYIYC7d3hS/MtLZOfEoIwhomI=;
 b=L9M4EFE6gnvqWpnFOQwN7dMvfhgstQSsXk+vYQiueGSBfpxPGZwMZGRNa8iClGE5mJ
 lFA2srK1XLXvjFEGDU5TIQjwg8NXi2wujue3l17ex0NeXXm2LhI58Alxcdt5QoEDwi9p
 sqNcc1KEh5sVGJM4jshgOQm1GMbD6JZrgV1pMdowHHkrrXn5RYAcRA0MUzOUM/eAL/22
 ZG+fzZuNWrrCySvpI9ySJcmcQIz5f1Cj0ck/JFYyotYkcUbsU2G+O3njtoyjUISCvavF
 xyXTpM/xTODYwbJ5kmh238LkaSyxaips1/1oNkjmcsoJk/y3+kfcuKfNwRVwAHUgpivk
 2jOA==
X-Gm-Message-State: AOAM532NzB9Flo3zC2ycaPdW2GRwpl4g71kQJMwAqAqvhGu68Bc4b7JO
 Ltl4hc+FPvWgo2HH0RGN2i4sRw==
X-Google-Smtp-Source: ABdhPJzwV4llaBHW3GPEKFOSStvceavjRaL8orYDfMptOnOkOdVq+p2+QBVgeWrzCKaDMSgV+ExHjg==
X-Received: by 2002:adf:ab46:: with SMTP id r6mr6189970wrc.71.1634811565959;
 Thu, 21 Oct 2021 03:19:25 -0700 (PDT)
Received: from google.com ([95.148.6.207])
 by smtp.gmail.com with ESMTPSA id m8sm4414195wri.33.2021.10.21.03.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 03:19:25 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:19:23 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <YXE+qx6hZ4T9B+QP@google.com>
References: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
 <20211012153945.2651412-10-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211012153945.2651412-10-u.kleine-koenig@pengutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 09/20] mfd: stmpe: Make stmpe_remove()
	return void
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

T24gVHVlLCAxMiBPY3QgMjAyMSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IFVwIHRvIG5v
dyBzdG1wZV9yZW1vdmUoKSByZXR1cm5zIHplcm8gdW5jb25kaXRpb25hbGx5LiBNYWtlIGl0IHJl
dHVybgo+IHZvaWQgaW5zdGVhZCB3aGljaCBtYWtlcyBpdCBlYXNpZXIgdG8gc2VlIGluIHRoZSBj
YWxsZXJzIHRoYXQgdGhlcmUgaXMKPiBubyBlcnJvciB0byBoYW5kbGUuCj4gCj4gQWxzbyB0aGUg
cmV0dXJuIHZhbHVlIG9mIGkyYyBhbmQgc3BpIHJlbW92ZSBjYWxsYmFja3MgaXMgaWdub3JlZCBh
bnl3YXkuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtv
ZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgZHJpdmVycy9tZmQvc3RtcGUtaTJjLmMgfCA0
ICsrKy0KPiAgZHJpdmVycy9tZmQvc3RtcGUtc3BpLmMgfCA0ICsrKy0KPiAgZHJpdmVycy9tZmQv
c3RtcGUuYyAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9tZmQvc3RtcGUuaCAgICAgfCAyICstCj4g
IDQgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKQXBwbGll
ZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExl
YWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
