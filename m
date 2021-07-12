Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6B03C57F2
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jul 2021 12:59:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A111C57B6F;
	Mon, 12 Jul 2021 10:59:58 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 227F9C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jul 2021 10:59:56 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id b12so16015162pfv.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jul 2021 03:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WREkE/g8FpPKuJRp28g0KPtp143iqVPQiyXuD7rAV7c=;
 b=eKfwf0fYqgellg4a3TT8I/xwXdMSNeX5UTDXKWb/9DOH07WREWVf4P5B9y0kc1qJLS
 pwC/stduWZOaZnC3Imqp7Pw5KOVUaVO9ShE5DzJO+lQk5XKo5wzL7sqc7q+xa3x8MqvS
 3fbt1yWJ/o2UypKlth1bYFzrtgdApMyrF+7UrsQv9HCSHRu9SQQcKT8Jf0FN+RIlQMYq
 eYg7iNrwli5NiABBILF7z2H6j9IqzTBZP0cg4FU/Tgu0GCIe3cLlRiN/VNJuOokdfkVl
 OxWicNRo3gMbXosrxQiaqfkcAk88cWh9YsvW0rlSuROX0z1HCIzuTqzbLZFiKwo8gwHR
 5oTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WREkE/g8FpPKuJRp28g0KPtp143iqVPQiyXuD7rAV7c=;
 b=L5PbduniQ19lnmlUTTtnyhdL9Bs5jnf15ZB7Zb5uLZAqR+uDDWxCWUNPV4oAlt6vJm
 UoE+cdHg9aU9du+pnZ0jufjitdtgeKGkBnfeReoQFueDQVulpVHPmHrvUE0QtmiHOB/t
 e3FfF99cthWVcSRmrQEBCuNnG96Pl8Ao8VnSCiWlRL/z/sClkqjHzIwJ22nGs1z3DP16
 Ec1UORw5HZOXWmuSxgQ1XWq/gMiwo3bdlqogceP5PJNhyJqAoP6Wo5U+HuqkoffHINs2
 814ZzHhlMUXsAUXqEPAeu9O9Nlf7S+TWXeuv16CtJwDXjFzWVq89qXgvOhNp6RZN0I+q
 iNcQ==
X-Gm-Message-State: AOAM530OdheHRayWLLfCTS5TOvX5y2P+KrVklh1Xr/+36aTkVwKT1gdo
 FsoOYdTN4zyCpjACQ8wo2HU=
X-Google-Smtp-Source: ABdhPJxF3G6kR0d1CQIqEDK29G8d9TT21cAiBZcMqa5CmtQaVpaNkIRX3MdKFcYtuT4na/Kg6CyfCQ==
X-Received: by 2002:aa7:8f27:0:b029:32c:b081:5497 with SMTP id
 y7-20020aa78f270000b029032cb0815497mr2196629pfr.54.1626087594575; 
 Mon, 12 Jul 2021 03:59:54 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v21sm15200484pfu.192.2021.07.12.03.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 03:59:53 -0700 (PDT)
Date: Mon, 12 Jul 2021 19:59:47 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: syednwaris@gmail.com, Jonathan Cameron <jic23@kernel.org>
Message-ID: <YOwgo8kvBge5F6k1@shinobu>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
 <4ce9f9d36b756801457523e3832f09c36fa8e9ef.1625471640.git.vilhelm.gray@gmail.com>
 <20210711144449.65cf28d9@jic23-huawei>
MIME-Version: 1.0
In-Reply-To: <20210711144449.65cf28d9@jic23-huawei>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v12 17/17] counter: 104-quad-8: Add IRQ
 support for the ACCES 104-QUAD-8
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
Content-Type: multipart/mixed; boundary="===============8922753241555508929=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8922753241555508929==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zYAqSWEms0x8GsFY"
Content-Disposition: inline


--zYAqSWEms0x8GsFY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 11, 2021 at 02:44:49PM +0100, Jonathan Cameron wrote:
> On Mon,  5 Jul 2021 17:19:05 +0900
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
>=20
> > The LSI/CSI LS7266R1 chip provides programmable output via the FLG pins.
> > When interrupts are enabled on the ACCES 104-QUAD-8, they occur whenever
> > FLG1 is active. Four functions are available for the FLG1 signal: Carry,
> > Compare, Carry-Borrow, and Index.
> >=20
> > 	Carry:
> > 		Interrupt generated on active low Carry signal. Carry
> > 		signal toggles every time the respective channel's
> > 		counter overflows.
> >=20
> > 	Compare:
> > 		Interrupt generated on active low Compare signal.
> > 		Compare signal toggles every time respective channel's
> > 		preset register is equal to the respective channel's
> > 		counter.
> >=20
> > 	Carry-Borrow:
> > 		Interrupt generated on active low Carry signal and
> > 		active low Borrow signal. Carry signal toggles every
> > 		time the respective channel's counter overflows. Borrow
> > 		signal toggles every time the respective channel's
> > 		counter underflows.
> >=20
> > 	Index:
> > 		Interrupt generated on active high Index signal.
> >=20
> > These four functions correspond respectivefly to the following four
> > Counter event types: COUNTER_EVENT_OVERFLOW, COUNTER_EVENT_THRESHOLD,
> > COUNTER_EVENT_OVERFLOW_UNDERFLOW, and COUNTER_EVENT_INDEX. Interrupts
> > push Counter events to event channel X, where 'X' is the respective
> > channel whose FLG1 activated.
> >=20
> > This patch adds IRQ support for the ACCES 104-QUAD-8. The interrupt line
> > numbers for the devices may be configured via the irq array module
> > parameter.
> >=20
> > Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
>=20
> Trivial comment inline.

I agree with the change because it'll make the code for the 104-QUAD-8
driver much clearer to read, but I'd prefer to postpone it until after
this patchset is merged so that we don't introduce too many new changes
now that we've got this pretty stable.

Syed, would you take a look at this and see if we can use the FIELD_PREP
macro to simplify all the shifting we're doing in the 104-quad-8 driver?

Thanks,

William Breathitt Gray

> > ---
> >  drivers/counter/104-quad-8.c | 167 +++++++++++++++++++++++++++++++++--
> >  drivers/counter/Kconfig      |   6 +-
> >  2 files changed, 164 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> > index a56751bf1e9b..1cbd60aaed69 100644
> > --- a/drivers/counter/104-quad-8.c
> > +++ b/drivers/counter/104-quad-8.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/errno.h>
> >  #include <linux/io.h>
> >  #include <linux/ioport.h>
> > +#include <linux/interrupt.h>
> >  #include <linux/isa.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> > @@ -25,6 +26,10 @@ static unsigned int num_quad8;
> >  module_param_hw_array(base, uint, ioport, &num_quad8, 0);
> >  MODULE_PARM_DESC(base, "ACCES 104-QUAD-8 base addresses");
> > =20
> > +static unsigned int irq[max_num_isa_dev(QUAD8_EXTENT)];
> > +module_param_hw_array(irq, uint, irq, NULL, 0);
> > +MODULE_PARM_DESC(irq, "ACCES 104-QUAD-8 interrupt line numbers");
> > +
> >  #define QUAD8_NUM_COUNTERS 8
> > =20
> >  /**
> > @@ -38,6 +43,8 @@ MODULE_PARM_DESC(base, "ACCES 104-QUAD-8 base address=
es");
> >   * @quadrature_scale:	array of quadrature mode scale configurations
> >   * @ab_enable:		array of A and B inputs enable configurations
> >   * @preset_enable:	array of set_to_preset_on_index attribute configura=
tions
> > + * @irq_trigger:	array of current IRQ trigger function configurations
> > + * @next_irq_trigger:	array of next IRQ trigger function configurations
> >   * @synchronous_mode:	array of index function synchronous mode configu=
rations
> >   * @index_polarity:	array of index function polarity configurations
> >   * @cable_fault_enable:	differential encoder cable status enable confi=
gurations
> > @@ -53,13 +60,17 @@ struct quad8 {
> >  	unsigned int quadrature_scale[QUAD8_NUM_COUNTERS];
> >  	unsigned int ab_enable[QUAD8_NUM_COUNTERS];
> >  	unsigned int preset_enable[QUAD8_NUM_COUNTERS];
> > +	unsigned int irq_trigger[QUAD8_NUM_COUNTERS];
> > +	unsigned int next_irq_trigger[QUAD8_NUM_COUNTERS];
> >  	unsigned int synchronous_mode[QUAD8_NUM_COUNTERS];
> >  	unsigned int index_polarity[QUAD8_NUM_COUNTERS];
> >  	unsigned int cable_fault_enable;
> >  	unsigned int base;
> >  };
> > =20
> > +#define QUAD8_REG_INTERRUPT_STATUS 0x10
> >  #define QUAD8_REG_CHAN_OP 0x11
> > +#define QUAD8_REG_INDEX_INTERRUPT 0x12
> >  #define QUAD8_REG_INDEX_INPUT_LEVELS 0x16
> >  #define QUAD8_DIFF_ENCODER_CABLE_STATUS 0x17
> >  /* Borrow Toggle flip-flop */
> > @@ -92,8 +103,8 @@ struct quad8 {
> >  #define QUAD8_RLD_CNTR_OUT 0x10
> >  /* Transfer Preset Register LSB to FCK Prescaler */
> >  #define QUAD8_RLD_PRESET_PSC 0x18
> > -#define QUAD8_CHAN_OP_ENABLE_COUNTERS 0x00
> >  #define QUAD8_CHAN_OP_RESET_COUNTERS 0x01
> > +#define QUAD8_CHAN_OP_ENABLE_INTERRUPT_FUNC 0x04
> >  #define QUAD8_CMR_QUADRATURE_X1 0x08
> >  #define QUAD8_CMR_QUADRATURE_X2 0x10
> >  #define QUAD8_CMR_QUADRATURE_X4 0x18
> > @@ -378,13 +389,103 @@ static int quad8_action_read(struct counter_devi=
ce *counter,
> >  	}
> >  }
> > =20
> > +enum {
> > +	QUAD8_EVENT_NONE =3D -1,
> > +	QUAD8_EVENT_CARRY =3D 0,
> > +	QUAD8_EVENT_COMPARE =3D 1,
> > +	QUAD8_EVENT_CARRY_BORROW =3D 2,
> > +	QUAD8_EVENT_INDEX =3D 3,
> > +};
> > +
> > +static int quad8_events_configure(struct counter_device *counter)
> > +{
> > +	struct quad8 *const priv =3D counter->priv;
> > +	unsigned long irq_enabled =3D 0;
> > +	unsigned long irqflags;
> > +	size_t channel;
> > +	unsigned long ior_cfg;
> > +	unsigned long base_offset;
> > +
> > +	spin_lock_irqsave(&priv->lock, irqflags);
> > +
> > +	/* Enable interrupts for the requested channels, disable for the rest=
 */
> > +	for (channel =3D 0; channel < QUAD8_NUM_COUNTERS; channel++) {
> > +		if (priv->next_irq_trigger[channel] =3D=3D QUAD8_EVENT_NONE)
> > +			continue;
> > +
> > +		if (priv->irq_trigger[channel] !=3D priv->next_irq_trigger[channel])=
 {
> > +			/* Save new IRQ function configuration */
> > +			priv->irq_trigger[channel] =3D priv->next_irq_trigger[channel];
> > +
> > +			/* Load configuration to I/O Control Register */
> > +			ior_cfg =3D priv->ab_enable[channel] |
> > +				  priv->preset_enable[channel] << 1 |
> > +				  priv->irq_trigger[channel] << 3;
>=20
> Nicer to define masks and use FIELD_PREP etc for these rather than hiding=
 shifts
> down here in the code.
>=20
> > +			base_offset =3D priv->base + 2 * channel + 1;
> > +			outb(QUAD8_CTR_IOR | ior_cfg, base_offset);
> > +		}
> > +
> > +		/* Reset next IRQ trigger function configuration */
> > +		priv->next_irq_trigger[channel] =3D QUAD8_EVENT_NONE;
> > +
> > +		/* Enable IRQ line */
> > +		irq_enabled |=3D BIT(channel);
> > +	}
> > +
> > +	outb(irq_enabled, priv->base + QUAD8_REG_INDEX_INTERRUPT);
> > +
> > +	spin_unlock_irqrestore(&priv->lock, irqflags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int quad8_watch_validate(struct counter_device *counter,
> > +				const struct counter_watch *watch)
> > +{
> > +	struct quad8 *const priv =3D counter->priv;
> > +
> > +	if (watch->channel > QUAD8_NUM_COUNTERS - 1)
> > +		return -EINVAL;
> > +
> > +	switch (watch->event) {
> > +	case COUNTER_EVENT_OVERFLOW:
> > +		if (priv->next_irq_trigger[watch->channel] =3D=3D QUAD8_EVENT_NONE)
> > +			priv->next_irq_trigger[watch->channel] =3D QUAD8_EVENT_CARRY;
> > +		else if (priv->next_irq_trigger[watch->channel] !=3D QUAD8_EVENT_CAR=
RY)
> > +			return -EINVAL;
> > +		return 0;
> > +	case COUNTER_EVENT_THRESHOLD:
> > +		if (priv->next_irq_trigger[watch->channel] =3D=3D QUAD8_EVENT_NONE)
> > +			priv->next_irq_trigger[watch->channel] =3D QUAD8_EVENT_COMPARE;
> > +		else if (priv->next_irq_trigger[watch->channel] !=3D QUAD8_EVENT_COM=
PARE)
> > +			return -EINVAL;
> > +		return 0;
> > +	case COUNTER_EVENT_OVERFLOW_UNDERFLOW:
> > +		if (priv->next_irq_trigger[watch->channel] =3D=3D QUAD8_EVENT_NONE)
> > +			priv->next_irq_trigger[watch->channel] =3D QUAD8_EVENT_CARRY_BORROW;
> > +		else if (priv->next_irq_trigger[watch->channel] !=3D QUAD8_EVENT_CAR=
RY_BORROW)
> > +			return -EINVAL;
> > +		return 0;
> > +	case COUNTER_EVENT_INDEX:
> > +		if (priv->next_irq_trigger[watch->channel] =3D=3D QUAD8_EVENT_NONE)
> > +			priv->next_irq_trigger[watch->channel] =3D QUAD8_EVENT_INDEX;
> > +		else if (priv->next_irq_trigger[watch->channel] !=3D QUAD8_EVENT_IND=
EX)
> > +			return -EINVAL;
> > +		return 0;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> >  static const struct counter_ops quad8_ops =3D {
> >  	.signal_read =3D quad8_signal_read,
> >  	.count_read =3D quad8_count_read,
> >  	.count_write =3D quad8_count_write,
> >  	.function_read =3D quad8_function_read,
> >  	.function_write =3D quad8_function_write,
> > -	.action_read =3D quad8_action_read
> > +	.action_read =3D quad8_action_read,
> > +	.events_configure =3D quad8_events_configure,
> > +	.watch_validate =3D quad8_watch_validate,
> >  };
> > =20
> >  static const char *const quad8_index_polarity_modes[] =3D {
> > @@ -579,7 +680,8 @@ static int quad8_count_enable_write(struct counter_=
device *counter,
> > =20
> >  	priv->ab_enable[count->id] =3D enable;
> > =20
> > -	ior_cfg =3D enable | priv->preset_enable[count->id] << 1;
> > +	ior_cfg =3D enable | priv->preset_enable[count->id] << 1 |
> > +		  priv->irq_trigger[count->id] << 3;
> > =20
> >  	/* Load I/O control configuration */
> >  	outb(QUAD8_CTR_IOR | ior_cfg, base_offset + 1);
> > @@ -728,7 +830,8 @@ static int quad8_count_preset_enable_write(struct c=
ounter_device *counter,
> > =20
> >  	priv->preset_enable[count->id] =3D preset_enable;
> > =20
> > -	ior_cfg =3D priv->ab_enable[count->id] | preset_enable << 1;
> > +	ior_cfg =3D priv->ab_enable[count->id] | preset_enable << 1 |
> > +		  priv->irq_trigger[count->id] << 3;
> > =20
> >  	/* Load I/O control configuration to Input / Output Control Register =
*/
> >  	outb(QUAD8_CTR_IOR | ior_cfg, base_offset);
> > @@ -980,11 +1083,54 @@ static struct counter_count quad8_counts[] =3D {
> >  	QUAD8_COUNT(7, "Channel 8 Count")
> >  };
> > =20
> > +static irqreturn_t quad8_irq_handler(int irq, void *private)
> > +{
> > +	struct quad8 *const priv =3D private;
> > +	const unsigned long base =3D priv->base;
> > +	unsigned long irq_status;
> > +	unsigned long channel;
> > +	u8 event;
> > +
> > +	irq_status =3D inb(base + QUAD8_REG_INTERRUPT_STATUS);
> > +	if (!irq_status)
> > +		return IRQ_NONE;
> > +
> > +	for_each_set_bit(channel, &irq_status, QUAD8_NUM_COUNTERS) {
> > +		switch (priv->irq_trigger[channel]) {
> > +		case QUAD8_EVENT_CARRY:
> > +			event =3D COUNTER_EVENT_OVERFLOW;
> > +				break;
> > +		case QUAD8_EVENT_COMPARE:
> > +			event =3D COUNTER_EVENT_THRESHOLD;
> > +				break;
> > +		case QUAD8_EVENT_CARRY_BORROW:
> > +			event =3D COUNTER_EVENT_OVERFLOW_UNDERFLOW;
> > +				break;
> > +		case QUAD8_EVENT_INDEX:
> > +			event =3D COUNTER_EVENT_INDEX;
> > +				break;
> > +		default:
> > +			/* should never reach this path */
> > +			WARN_ONCE(true, "invalid interrupt trigger function %u configured f=
or channel %lu\n",
> > +				  priv->irq_trigger[channel], channel);
> > +			continue;
> > +		}
> > +
> > +		counter_push_event(&priv->counter, event, channel);
> > +	}
> > +
> > +	/* Clear pending interrupts on device */
> > +	outb(QUAD8_CHAN_OP_ENABLE_INTERRUPT_FUNC, base + QUAD8_REG_CHAN_OP);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> >  static int quad8_probe(struct device *dev, unsigned int id)
> >  {
> >  	struct quad8 *priv;
> >  	int i, j;
> >  	unsigned int base_offset;
> > +	int err;
> > =20
> >  	if (!devm_request_region(dev, base[id], QUAD8_EXTENT, dev_name(dev)))=
 {
> >  		dev_err(dev, "Unable to lock port addresses (0x%X-0x%X)\n",
> > @@ -1009,6 +1155,8 @@ static int quad8_probe(struct device *dev, unsign=
ed int id)
> > =20
> >  	spin_lock_init(&priv->lock);
> > =20
> > +	/* Reset Index/Interrupt Register */
> > +	outb(0x00, base[id] + QUAD8_REG_INDEX_INTERRUPT);
> >  	/* Reset all counters and disable interrupt function */
> >  	outb(QUAD8_CHAN_OP_RESET_COUNTERS, base[id] + QUAD8_REG_CHAN_OP);
> >  	/* Set initial configuration for all counters */
> > @@ -1035,11 +1183,18 @@ static int quad8_probe(struct device *dev, unsi=
gned int id)
> >  		outb(QUAD8_CTR_IOR, base_offset + 1);
> >  		/* Disable index function; negative index polarity */
> >  		outb(QUAD8_CTR_IDR, base_offset + 1);
> > +		/* Initialize next IRQ trigger function configuration */
> > +		priv->next_irq_trigger[i] =3D QUAD8_EVENT_NONE;
> >  	}
> >  	/* Disable Differential Encoder Cable Status for all channels */
> >  	outb(0xFF, base[id] + QUAD8_DIFF_ENCODER_CABLE_STATUS);
> > -	/* Enable all counters */
> > -	outb(QUAD8_CHAN_OP_ENABLE_COUNTERS, base[id] + QUAD8_REG_CHAN_OP);
> > +	/* Enable all counters and enable interrupt function */
> > +	outb(QUAD8_CHAN_OP_ENABLE_INTERRUPT_FUNC, base[id] + QUAD8_REG_CHAN_O=
P);
> > +
> > +	err =3D devm_request_irq(dev, irq[id], quad8_irq_handler, IRQF_SHARED,
> > +			       priv->counter.name, priv);
> > +	if (err)
> > +		return err;
> > =20
> >  	return devm_counter_register(dev, &priv->counter);
> >  }
> > diff --git a/drivers/counter/Kconfig b/drivers/counter/Kconfig
> > index d5d2540b30c2..3dcdb681c4e4 100644
> > --- a/drivers/counter/Kconfig
> > +++ b/drivers/counter/Kconfig
> > @@ -23,11 +23,11 @@ config 104_QUAD_8
> >  	  A counter's respective error flag may be cleared by performing a wr=
ite
> >  	  operation on the respective count value attribute. Although the
> >  	  104-QUAD-8 counters have a 25-bit range, only the lower 24 bits may=
 be
> > -	  set, either directly or via the counter's preset attribute. Interru=
pts
> > -	  are not supported by this driver.
> > +	  set, either directly or via the counter's preset attribute.
> > =20
> >  	  The base port addresses for the devices may be configured via the b=
ase
> > -	  array module parameter.
> > +	  array module parameter. The interrupt line numbers for the devices =
may
> > +	  be configured via the irq array module parameter.
> > =20
> >  config INTERRUPT_CNT
> >  	tristate "Interrupt counter driver"
>=20

--zYAqSWEms0x8GsFY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmDsIKMACgkQhvpINdm7
VJL/OhAAtGCEESYwARUyDTVX8HvpZ7ZqjEvqD+suaR/Vlln6anYUL275Ovy3a1qf
WzgTcOIdr5XesaD1i87wpKXN9615+PCI9wK8xULuh9wkS8GjjrJ7Pvhbdg1gybd5
9eXSjqw8LE7QyeglCT92fqZCtWJOIsfkbk+ULz+UaPJ4UK7P6e+CBBwJfon2NJeR
4jDFp7U+xoClwk24hhjYjL4ECDo98xUQpIDIB6nB/wHY5dPd7rcqyImSPqNYNKou
KqBJ8gAFh/TWXdtaBstISMKL12N0BsLgWzxrCQO6fJfSAtfYsv3HtdseYtJ5UiUg
ZFByTqkVsrtzcGBPaMRKIhrdsN+bcWBumRyG4dhRVOH4AywVfCf2lBbfUGm408tB
KC0nG+phMU3zrF1+QEKRGqiP2Yk4+pyvgNNvqTrjsXA7gfzqLtIV96gHM9bHWUNm
5t118IqbAFaQeDKgLKeZpBj3xtQZmP/NQ7pJdCdl9fvtHL/FBD/5NBKjy1kkbq3c
zxjN2celjJTFihD/+F+95UQD7zE9Oj1Qf97mY4xeEk1xBazZJRZzOeBgZveAN8i0
tzlmUabejDo3p80V9RpVvupxkFZw4wBgA9M0NcBAR4IHpSHCAGLRTY1ouRnou8/p
6k94rNXSbJi34JlPCLCDGGzaGEGfvUzzkEoel5hsEQxcjXeYpPc=
=NxWE
-----END PGP SIGNATURE-----

--zYAqSWEms0x8GsFY--

--===============8922753241555508929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8922753241555508929==--
