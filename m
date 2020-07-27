Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE7022F6F6
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jul 2020 19:47:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9251C36B27;
	Mon, 27 Jul 2020 17:47:48 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CD7AC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 17:47:46 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id g7so9661154ejw.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 10:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ijZvlgHQ+v2BWZ6VMCXnmgIYM9lqeQKC/Q58LwpkS18=;
 b=goLiuJ7DPYB9oXd4K0FnBTft52vRIoaP8HHEoIjYGrc+tPTm98AuJdQQocC0tZrdIO
 ISnBrkYunC/SuXetp8LVr0AUf/okLJ7rrydaj2DlRa14m/mvYjy2MO9Rvx0uPp+A8RyR
 ymBD+HZEaA5cJTq65kSojT0vwfQ4HSr8m4XWE/Xzs+yGcAoqpMhdWdDComye4rXmIyNH
 1mMPIkOzJGlzCzIIULku257QIFw6Zzwpm0koPrP4cP4qc+XHaUVgWdwTt7t3gSy+4oyy
 m7HHgCRC9ms0IxORbtyaQdhlzBR/Pv7QY3qA5NofrhA7hDTOz7MJv713hvGuzUJiqbpc
 bzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ijZvlgHQ+v2BWZ6VMCXnmgIYM9lqeQKC/Q58LwpkS18=;
 b=bHmuQWGFkjgIjSJooRlhPh8IWofquIoiSvhxD+V7dqVodxx0Z56uXT4xjfPYdpXaYI
 vAFdGGCRhdzYWEN8FKUDWGqSVRDusGeLbvU2KFgAXfoqgqiwkUWiwUnX02PtZzl52X9K
 JLPspsNNAabOZDKH0XMefpmr6QgQGhhCBfkZyRI77zsZ/mnT0Jrzi9AD6yxIlLiCwE9z
 IX4fvUWnZc82JDYHpybwwY32WOVVOA0/If1GuC86zbSS6BwnOT/3aT+/JbnzsGvCIVYf
 kB8nTQd8pCGvCu2OsY2UdnFwAlj4tYiBeguboaI3lnentt8q0QKItnXKqdf4bo6A/IsR
 vNqQ==
X-Gm-Message-State: AOAM533vmVZ9Wce9jU/MNbGJLvAxGeHfpVlj1crqt4H87sD4IGW2IZZn
 N2t3enaPwGFDZ+GCTxNYbB1npl/6zrb+KSVZNwg=
X-Google-Smtp-Source: ABdhPJyWjX1lCFQR4mrrLCa3z5egBfKg89MlfQ1v3c4dfSsnCgXyu7fZcZo4LE8I8xaNaz1PFPPa723qH/VZge8XLSU=
X-Received: by 2002:a17:906:743:: with SMTP id
 z3mr21889697ejb.216.1595872066116; 
 Mon, 27 Jul 2020 10:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200727092346.19780-1-amelie.delaunay@st.com>
 <20200727092346.19780-2-amelie.delaunay@st.com>
In-Reply-To: <20200727092346.19780-2-amelie.delaunay@st.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Jul 2020 19:47:35 +0200
Message-ID: <CAFBinCA_GzdWC+L3Wj_PesRmNFP2rhpZ6jWhhNJP03O5AHc5Kw@mail.gmail.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/3] dt-bindings: usb: dwc2: add
 optional usb-role-switch property
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Amelie,

thank you for adding this patch!

On Mon, Jul 27, 2020 at 11:23 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:
>
> This patch documents the usb-role-switch property in dwc2 bindings, now
> that usb-role-switch support is available in dwc2 driver.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
please add my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Martin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
