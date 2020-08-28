Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BABE255866
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 12:10:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44FAFC32EA6;
	Fri, 28 Aug 2020 10:10:47 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06B61C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 10:10:45 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u18so413134wmc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 03:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4JMFr37STORIgQm4bGEPTAK7/SSI+Z3+hSKZb/jWMU8=;
 b=E/6Z7lX1dsrGY7Qz9e8ERJFdEWAi6Gq+LQeGQ6iQSyk4/VPsQA5bwQc95uE2CYoGf1
 2Gdrh5HzLDnqKQJSGCpWN1EPyRBfF5SnUHF3ThWjBAt3AneY2bckqlYuemdLTl/4JFRN
 Dvo+6qDabXIQF/REsdK6ydQ9T0ZhcZUe53vz/jmnbj5ij4+nNU09HsD9lrNPjw8garom
 fAhtPMM6z8qTWZ8iXQ1WrlacR5jSIKFC9nXHkmoO3/pDyrtpmglCAkGHA7asTGIvZ4p9
 qDEV6w00/ZPPS6yvvZ7QjqBcvK416IOiANM7xgZXferQQ5OJNlAlUxHseyoFyT6cyxnW
 yBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4JMFr37STORIgQm4bGEPTAK7/SSI+Z3+hSKZb/jWMU8=;
 b=jxF4vWlZZQU23LlmBlMWxY8j9Hb7HxMEJigFnr0+TwMyt1GPOBb2DjJVAVJIIxaNYJ
 AuiGIm4f3bUiMdqEvE9hLXNakKsfXi0em16vl8nCEbwHMsiYzXx0mEabFIUcdz0voEWJ
 l2gqZJMIRBdob2PW2kThC+Gz+59NZepPnmocJGKmExBUOKyGOV+ZPfQWV/ERzosDrJRQ
 8wsv0pXc6OKhuWL8kh6i+3QsmWbr13AYiOP8cF/Ymrs7dPPoP6bQ6+Mo6NMZ4wIDzZKd
 HoRf+7JpDv84RXkAbEgZAi3PivWfGA9DYHk3LDL1QJ7Oe/zz2nrhRt91UXdqmvDa83wL
 DdLw==
X-Gm-Message-State: AOAM530VDBzveTyqnnrmUChykXUx6rmrOLWSw7EHLt7WawHFcDWz3otX
 1QhTt8XYsvSJLHPUKuTLqfyVvA==
X-Google-Smtp-Source: ABdhPJyd+zEtUn0Pjz24wfI5YhO/ufo1ZrWKml5JZ0SodFr9cwTiaHJAlEhrfM6A5OyXlNedrLY2Yw==
X-Received: by 2002:a7b:c316:: with SMTP id k22mr898552wmj.150.1598609445574; 
 Fri, 28 Aug 2020 03:10:45 -0700 (PDT)
Received: from dell ([91.110.221.141])
 by smtp.gmail.com with ESMTPSA id g18sm1243165wru.27.2020.08.28.03.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:10:44 -0700 (PDT)
Date: Fri, 28 Aug 2020 11:10:39 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200828101039.GJ1826686@dell>
References: <20200826144935.10067-1-krzk@kernel.org>
 <20200826144935.10067-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826144935.10067-3-krzk@kernel.org>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] mfd: wcd934x: Simplify with
	dev_err_probe()
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

T24gV2VkLCAyNiBBdWcgMjAyMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gQ29tbW9u
IHBhdHRlcm4gb2YgaGFuZGxpbmcgZGVmZXJyZWQgcHJvYmUgY2FuIGJlIHNpbXBsaWZpZWQgd2l0
aAo+IGRldl9lcnJfcHJvYmUoKS4gIExlc3MgY29kZSBhbmQgYWxzbyBpdCBwcmludHMgdGhlIGVy
cm9yIHZhbHVlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tZmQvd2NkOTM0eC5jIHwgOSArKystLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCkFwcGxp
ZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBM
ZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3
YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
