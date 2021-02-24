Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89573323F2B
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Feb 2021 15:32:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CBDEC57B59;
	Wed, 24 Feb 2021 14:32:18 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D32CC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 14:16:05 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id f1so3274636lfu.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 06:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flowbird.group; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=v3HKl8MAdzjkZRpkKqO0HYBnFos8syG4zKo3F6fh+Go=;
 b=rD8LEX94d5BixtRBlNjexCsc/guNkhDs1ACcK5IKU0GDrodPL3VD3eNBak4b9Z4DyB
 uC5LJxo532jQM1DmdTRzeykzROlbcQBsBgJPrDg5UEY5dG35BRlEdvdW5XE5Kgu0NNk8
 i+ap4FFqUXzHBfrTCJ2j8NuciVDyBS0H/KlhiFo3lJChTyO8rgmJ9LAfPJQhOKqGLU+L
 muWaaHP3xsf1HtViaX0XXbqZf392GZ1QHERwIFgaD/mti1PNEvYMP0+1fK8Kgs7zLYbC
 WF6l8CNRAqY6Kj+SqrYmjlmJulLXvCM9ehF+/Ge02qbY4V3C73yl6FXbRS8tcLTzEfow
 sk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=v3HKl8MAdzjkZRpkKqO0HYBnFos8syG4zKo3F6fh+Go=;
 b=P2XLo7Wi95BfiyQJWc7dEe5vtO85EvqZ1SgZb6Hba5qwz/AKHbXrogWK3/dvD5VoJo
 fa8J6IXAIrbJyCe99HM5Kk/KJUokCZ22CS9MSUYepmQUvnYWXUOnRyHmEpwnac1WdMrq
 zaqHK0eCcjzGVagWbDqIiW8qG3ExO6urmg8UQT+nW/t52yEzho1XjSsE6LzPazrriRBH
 fhdwAXg18173ZjMQj0sUMvimnZKZHOAuYZ+cEZ8rrJDDEJHTjYhz4aNf/PmO8EEmqdBy
 hojAOfgibPdpJ5L80WMtaWzz4fzW8Tnn4cTOPXQWT86EhyZMrCtj13a026qM7TdvGd1j
 w+fQ==
X-Gm-Message-State: AOAM533t6sot26+zCYec4Ht8EVCbbJ7zkWs5draUww2X335jdlUSTX5X
 5yryhN1j1CKeq0mWm257wy7mfswBWsQE2Kon2zwMbikASzDWhw==
X-Google-Smtp-Source: ABdhPJxwdS0rsx4pN6IE+T8Krt3X6uXvFL8VBMtuY30EVaeDol3AY031+/PXhW9f9lKdTAiCGwOzzsuSa4zcAkj0xnY=
X-Received: by 2002:ac2:54ab:: with SMTP id w11mr3786966lfk.260.1614176164055; 
 Wed, 24 Feb 2021 06:16:04 -0800 (PST)
MIME-Version: 1.0
From: "Fuzzey, Martin" <martin.fuzzey@flowbird.group>
Date: Wed, 24 Feb 2021 15:15:53 +0100
Message-ID: <CANh8Qzy9B5qCkwZLiWaJahQX4oMg07dn0276vqeCzEcqgXTd+g@mail.gmail.com>
To: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Wed, 24 Feb 2021 14:32:17 +0000
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [Linux-stm32] [BUG] stm32mp1 gpiod_to_irq() can cause "interrupt
	stealing"
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

Hi,

I have run into a rather nasty problem on STM32MP1 and I'm not quite
sure of the right way to fix it (otherwise I would have sent a patch).

It is possible for one driver to break another driver's GPIO interrupts.
In fact it is even possible for userspace to break a driver's interrupts.

On STM32MP1 the external GPIO interrupts go through the EXTI module
which has 16 interrupt lines connected to the ARM GIC.
The EXTI maps the GPIO interrupts by line number (so GPIOA_0, GPIOB_0
...) all share one GIC interrupt line and only one can
be used at any time (selected by a multiplexer register in the EXTI)

The existing stm32mp1 pinctrl driver already handles this, both the
setting of the EXTI multiplexer and mutual exclusion.

However consider a driver which does something like

    int irq = gpiod_to_irq(gpiod);
    int ret = devm_request_irq(dev, irq, ...)

Suppose there are 2 such drivers using a gpiod configured from DT that
happen to both have the same line number
(eg GPIOA0 and GPIOB0)

In this case everything works fine initially for the first driver to probe.
When the second driver probes gpiod_to_irq() obtains a linux virq
number but devm_request_irq() returns -EBUSY.
So far so good, the DT configuration was not compatible with the
hardware constraints so it is expected to fail.

However, after the second driver calls gpiod_to_irq(), the interrupt
already successfully obtained by the first driver no longer receives
any interrupts.

The reason is that gpiod_to_irq() calls the .alloc function of the
EXTI interrupt controller which, in turn calls .alloc of the parent
GIC interrupt controller.
That not only allocates a linux virq number but also changes the
mapping of the GIC interrupt line to the new VIRQ.

So when an interrupt occurs on the GPIO used by the first driver it
will now be mapped to the VIRQ allocated by the second driver and
ignored...

When using the legacy sysfs gpio interface it is even worse because it
is possible to break the interrupts of a kernel driver without even
explicitly requesting
an interrupt from userspace.

drivers/gpio/gpiolib-sysfs.c contains this function

static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
                               int n)
{
...
        if (attr == &dev_attr_direction.attr) {
                if (!show_direction)
                        mode = 0;
        } else if (attr == &dev_attr_edge.attr) {
                if (gpiod_to_irq(desc) < 0)
                        mode = 0;
                if (!show_direction && test_bit(FLAG_IS_OUT, &desc->flags))
                        mode = 0;
        }

        return mode;
}

The purpose of this is to hide the "edge" attribute if the GPIO does
not support interrupts (even if no interrupt has yet been requested
for that GPIO)
It does this using the call to gpiod_to_irq() and hiding the attribute
if it fails.

So, merely exporting to userspace via sysfs a GPIO (even not as an
interrupt) having the same line number as another GPIO used by a
kernel driver will break interrupts for
that driver...

Regards,

Martin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
