Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 336FAA10CFC
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 18:05:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7F92C78031;
	Tue, 14 Jan 2025 17:05:42 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9192C7802D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 17:05:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ACE23A4190A;
 Tue, 14 Jan 2025 17:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AF4C4CEDD;
 Tue, 14 Jan 2025 17:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736874333;
 bh=4l1I+oCpVV7aVqBA/IRj6rgmTYIBnLenVcNim925x0E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=lDVH8LkqBChhnuAGdV3aOQRdWR9sekjlr8og2bRGHplaBVZoyD1txgGW1pwALmvQq
 Hk1pk0EOjmzDMuh8/NRG65sEqF9Zwc0gX7ZSucljn7YKUxU88Cu6j9F2fMYpBKNHNN
 PqON+4tUWgo/5Dye6ShWYBh9PLNgsMKL6iYUwXOTED7Zf77Wsw8p8TmBJ/zR/X6uRA
 zFEtYX0laUVdmC3xya+m5cgWeu5KI1rhgVN8bF3loS+XAGJa7YZoaWYUKaWs2ZE3cW
 5sCdeKVBH8rbx29Dajlly0m5urNK3D3iTGsi5VlgvyP7nNh1EKXi9FSBRCftlmEDh9
 TIqh1LgB7cS+g==
Date: Tue, 14 Jan 2025 11:05:30 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20250114170530.GA464935@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef02ddbf-0838-4616-a3c5-ef7ab55de3c9@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 cassel@kernel.org, devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, manivannan.sadhasivam@linaro.org,
 bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/5] PCI: stm32: Add PCIe endpoint
 support for STM32MP25
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

On Mon, Dec 16, 2024 at 03:00:58PM +0100, Christian Bruel wrote:
> On 12/5/24 18:27, Bjorn Helgaas wrote:
> > On Tue, Nov 26, 2024 at 04:51:18PM +0100, Christian Bruel wrote:
> > > Add driver to configure the STM32MP25 SoC PCIe Gen2 controller based on the
> > > DesignWare PCIe core in endpoint mode.

> > > +static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
> > > +{
> > > +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > +	enum pci_barno bar;
> > > +
> > > +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> > > +		dw_pcie_ep_reset_bar(pci, bar);
> > > +
> > > +	/* Defer Completion Requests until link started */
> > 
> > I asked about this before [1] but didn't finish the conversation.  My
> > main point is that I think "Completion Request" is a misnomer.
> > There's a "Configuration Request" and a "Completion," but no such
> > thing as a "Completion Request."
> > 
> > Based on your previous response, I think this should say something
> > like "respond to config requests with Request Retry Status (RRS) until
> > we're prepared to handle them."
> 
> OK thanks for the phrasing. This is inline with the DWC doc:
> "... controller completes incoming configuration requests with a
> configuration request retry status."
> The only thing is that the PCIe specs talks about CRS, not RRS.
> 
> so slightly change to
> "respond to config requests with Configuration Request Retry Status (CRS)
> until we're prepared to handle them."

This terminology between PCIe r5.0 and r6.0.  In r5.0, sec 2.2.9
labels Completion Status value 010b as "Configuration Request Retry
Status (CRS)", but in r6.0, sec 2.2.9.1 labels that same value as
"Request Retry Status (RRS)".

We changed most usage inside drivers/pci/ to align with the r6.0 term
with https://git.kernel.org/linus/87f10faf166a ("PCI: Rename CRS
Completion Status to RRS").

But with respect to this patch, changing "Completion Request" to
"Configuration Request" is the main thing.

Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
