Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BB66E9062
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Apr 2023 12:36:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5E85C65E4F;
	Thu, 20 Apr 2023 10:36:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54283C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Apr 2023 10:36:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 115EC64710;
 Thu, 20 Apr 2023 10:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92792C433D2;
 Thu, 20 Apr 2023 10:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681987015;
 bh=w0fd5yrWbjgttI2C+r5ejTi50O12PXHjFCdNN7uEFpY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n6aosSq9fPEr4/jLahDzC1ZKlp8tPrGhuOAZp2erXS5vwf2huzEuM9tYOiBQPujtY
 XSvoMqwiRWzu8z3PBDBeKl5aOSZJb1s9IVdDBG7e+uFHVkCo4w7xAMobV3NN305e1M
 66FHhOyxA39CgKHHOkwy0uhiRVpshv0b3rpzuXaIotZjRiYBMKgucpKXkuuSdQ4tW3
 0N21PB0nBNnhcz63jLrCAdsa+0nXgh9vsqet7SJdlH5kTXTMkMIlGynRKNTTSaguj+
 q98PQk5sAQqUtwSqtxgv1XLrVQ7j+orEI8AvfsnzPoM44r0VYKkr2oMRHtDcPr5q7T
 2wOBBH9A+qlmg==
Date: Thu, 20 Apr 2023 11:36:50 +0100
From: Lee Jones <lee@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230420103650.GJ9904@google.com>
References: <20230417181342.v2.1.I483a676579cc7e3ac07e1db649091553743fecc8@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230417181342.v2.1.I483a676579cc7e3ac07e1db649091553743fecc8@changeid>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: mfd: stm32: Remove
 unnecessary blank lines
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

T24gTW9uLCAxNyBBcHIgMjAyMywgUGF0cmljayBEZWxhdW5heSB3cm90ZToKCj4gUmVtb3ZlIGRv
dWJsZSBibGFuayBsaW5lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBh
dHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAt
IHVwZGF0ZSBjb21taXQgdGl0bGUgYW5kIGNvbW1pdCBtZXNzYWdlIHRvIHJlZmxlY3Qgd2hhdCB0
aGUgY2hhbmdlIGlzCj4gICBWMT0iZHQtYmluZGluZ3M6IG1mZDogc3RtMzI6IEZpeCBTVE0zMkY0
IERUIGluY2x1ZGUgZmlsZSIKPiAKPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9tZmQvc3RtMzJmNC1y
Y2MuaCB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKQXBwbGllZCwgdGhh
bmtzCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
